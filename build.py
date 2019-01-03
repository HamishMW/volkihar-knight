import os
import shutil
import subprocess

ckClassicDir = 'C:\Program Files (x86)\Steam\steamapps\common\skyrim'
user_input = raw_input('Enter the release version: ')

# Build the temp directory
print 'Creating temp directories...'
tempdir = '.\\tmp'
if os.path.isdir(tempdir):
  print 'Removing old temp directory...'
  shutil.rmtree('.\\tmp')

def makeTempDirs(version):
  os.makedirs('./tmp/' + version + '/Data/meshes/classic/meshes/armor/volkiharknight')
  os.makedirs('./tmp/' + version + '/Data/meshes/classic/meshes/magic/volkiharknight')
  os.makedirs('./tmp/' + version + '/Data/meshes/special/meshes/armor/volkiharknight')
  os.makedirs('./tmp/' + version + '/Data/meshes/special/meshes/magic/volkiharknight')
  os.makedirs('./tmp/' + version + '/Data/Scripts')
  os.makedirs('./tmp/' + version + '/Data/Scripts/Source')
  os.makedirs('./tmp/' + version + '/Data/textures/armor/volkiharknight')

makeTempDirs('Volkihar Knight CE')
makeTempDirs('Volkihar Knight SE')

# Compile scripts
compiler = ckClassicDir + '/Papyrus Compiler/PapyrusCompiler.exe'
inputDir = '-i=./Scripts/Source;' + ckClassicDir + '/Data/Scripts/Source'
outputDir = '-o=./Scripts'
flags = '-f=TESV_Papyrus_Flags.flg'

subprocess.call([compiler, 'VolkiharAssassinInvisibilityScript.psc', inputDir, outputDir, flags])
subprocess.call([compiler, 'VolkiharKnightEquipScript.psc', inputDir, outputDir, flags])
subprocess.call([compiler, 'VolkiharKnightRoyalForceEffectScript.psc', inputDir, outputDir, flags])
subprocess.call([compiler, 'VolkiharKnightRoyalForceTriggerScript.psc', inputDir, outputDir, flags])

# Copy the project files
print 'Copying project files...'
with open('./archive-manifest.txt') as manifest:
  lines = manifest.readlines()
  for line in lines:
    sourcePath = '.\\' + line.rstrip('\n')
    if os.path.isdir(sourcePath):
      shutil.copy(sourcePath, tempdir + '\\CE\\Data\\' + line.rstrip('\n'))
      shutil.copy(sourcePath, tempdir + '\\SE\\Data\\' + line.rstrip('\n'))

# Build the directories
def buildDistDir(name, ckDir):
  dirname = './dist/' + name + ' ' + user_input + ' Release'
  if not os.path.isdir(dirname):
    print 'Creating new build...'
    os.makedirs(dirname)
  else:
    print 'Removing old build of same version...'
    shutil.rmtree(dirname)
    os.makedirs(dirname)

  os.makedirs(dirname + '/fomod')

  # Generate BSA archive
  print 'Generating ' + name + ' BSA archive...'
  shutil.copy(ckDir + '/Archive.exe', './tmp/' + name + '/Archive.exe')
  shutil.copy('./archive-builder.txt', './tmp/' + name + '/archive-builder.txt')
  shutil.copy('./archive-manifest.txt', './tmp/' + name + '/archive-manifest.txt')

  os.chdir('./tmp/' + name)
  subprocess.call(['./Archive.exe', './archive-builder.txt'])
  os.chdir('..\\..\\')

  # Copy files - Mod
  shutil.copyfile('./Volkihar Knight.esp', dirname + '/Volkihar Knight.esp')
  # shutil.copyfile('./tmp/Volkihar Knight.bsa', dirname + '/Data/Volkihar Knight.bsa')

  # Create release zip
  zip_name_ver = user_input.replace('.', '_')
  releaseName = name + ' ' + zip_name_ver + ' Release'
  
  shutil.make_archive(releaseName, format='zip', root_dir=dirname)
  shutil.move(releaseName + '.zip', releaseName + '.zip')
  print 'Created ' + releaseName + '.zip'

buildDistDir('Volkihar Knight CE', ckClassicDir)
# buildDistDir('Volkihar Knight SE')

# Clean Up
print 'Removing temp files...'
# shutil.rmtree('./tmp')

print 'Done!'
