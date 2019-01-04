import os
import shutil
import subprocess
import getopt

steamDirDefault = 'C:/Program Files (x86)/Steam'
steamDir = 'E:/Games/SteamLibrary'
modName = 'Volkihar Knight'
ckClassicDir = steamDir + '/steamapps/common/Skyrim'
ckClassicArchiver = ckClassicDir + '/Archive.exe'
ckSpecialDir = steamDir + '/steamapps/common/Skyrim Special Edition'
ckSpecialArchiver = ckSpecialDir + '/Tools/Archive/Archive.exe'
CEname = modName + ' CE'
SEname = modName + ' SE'

user_input = raw_input('Enter the release version: ')

# Build the temp directory
print 'Creating temp directories...'
tempdir = '.\\tmp'
if os.path.isdir(tempdir):
  print 'Removing old temp directory...'
  shutil.rmtree('.\\tmp')

def makeTempDirs(version):
  os.makedirs('./tmp/' + version + '/Data/meshes/armor/volkiharknight')
  os.makedirs('./tmp/' + version + '/Data/meshes/magic/volkiharknight')
  os.makedirs('./tmp/' + version + '/Data/Scripts')
  os.makedirs('./tmp/' + version + '/Data/textures/armor/volkiharknight')

makeTempDirs(CEname)
makeTempDirs(SEname)

# Compile scripts
def compileScripts(skyrimDir, skyrimScripts, name):
  print 'Compiling ' + name + ' build...'
  compiler = skyrimDir + '/Papyrus Compiler/PapyrusCompiler.exe'
  inputParam = '-i=./Scripts/Source;' + skyrimScripts
  outputParam = '-o=' + './tmp/' + name + '/Data/Scripts'
  subprocess.call([compiler, './Scripts/Source', '-a', inputParam, outputParam, '-f=TESV_Papyrus_Flags.flg'])

compileScripts(ckClassicDir, ckClassicDir + '/Data/Scripts/Source', CEname)
compileScripts(ckSpecialDir, ckSpecialDir + '/Data/Source/Scripts', SEname)

# Copy the project files
def copyFiles(name, baseDir):
  print 'Copying ' + name + baseDir + ' project files...'
  with open('./ArchiveManifest.txt') as manifest:
    lines = manifest.readlines()
    for line in lines:
      basePath = baseDir + line.rstrip('\n')
      if os.path.isfile(basePath):
        shutil.copy(basePath, tempdir + '\\' + name + '\\Data\\' + line.rstrip('\n'))

copyFiles(CEname, '.\\')
copyFiles(CEname, '.\\meshes\\classic\\')
copyFiles(SEname, '.\\')
copyFiles(SEname, '.\\meshes\\special\\')

# Build the directories
def buildDistDir(name, archive):
  dirname = './dist/' + name + ' ' + user_input

  def distDirs():
    os.makedirs(dirname)
    os.makedirs(dirname + '/Data')

  if not os.path.isdir(dirname):
    print 'Creating new ' + name + ' build...'
    distDirs()
  else:
    print 'Removing old ' + name + ' build of same version...'
    shutil.rmtree(dirname)
    distDirs()

  os.makedirs(dirname + '/fomod')

  # Generate BSA archive
  print 'Generating ' + name + ' BSA archive...'
  shutil.copy(archive, './tmp/' + name + '/Archive.exe')
  shutil.copy('./ArchiveBuilder.txt', './tmp/' + name + '/ArchiveBuilder.txt')
  shutil.copy('./ArchiveManifest.txt', './tmp/' + name + '/ArchiveManifest.txt')
  shutil.copy('./ArchiveLog.txt', './tmp/' + name + '/ArchiveLog.txt')

  os.chdir('./tmp/' + name)
  subprocess.call(['./Archive.exe', './ArchiveBuilder.txt'])
  os.chdir('..\\..\\')

  # Copy files - Mod
  shutil.copyfile('./Volkihar Knight.esp', dirname + '/Data/Volkihar Knight.esp')
  shutil.copyfile('./tmp/' + name + '/VolkiharKnight.bsa', dirname + '/Data/VolkiharKnight.bsa')

  # Create release zip
  zip_name_ver = user_input.replace('.', '_')
  releaseName = name + ' ' + zip_name_ver

  shutil.make_archive(releaseName, format='zip', root_dir=dirname)
  shutil.move(releaseName + '.zip', './dist/' + name + ' ' + user_input + '/' + releaseName + '.zip')
  print 'Created ' + releaseName + '.zip'

buildDistDir(CEname, ckClassicArchiver)
buildDistDir(SEname, ckSpecialArchiver)

# Clean Up
print 'Removing temp files...'
# shutil.rmtree('./tmp')

print 'Done!'
