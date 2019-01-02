import os
import shutil
import subprocess

user_input = raw_input("Enter the release version: ")

os.chdir("..\\")

# Build the temp directory
print "Creating temp directories..."
tempdir = ".\\tmp\\Data\\"
if os.path.isdir(tempdir):
    print "Removing old temp directory..."
    shutil.rmtree(".\\tmp")
os.makedirs('./tmp/Data/meshes/volkiharknight')
os.makedirs('./tmp/Data/Scripts')
os.makedirs('./tmp/Data/Scripts/Source')
os.makedirs('./tmp/Data/textures/volkiharknight')

# Copy the project files
print "Copying project files..."
with open("./archive-manifest.txt") as manifest:
    lines = manifest.readlines()
    for line in lines:
        shutil.copy(".\\Volkihar Knight\\" + line.rstrip('\n'), tempdir + line.rstrip('\n'))

# Build the directories
dirname = "./Volkihar Knight " + user_input + " Release"
if not os.path.isdir(dirname):
    print "Creating new build..."
    os.mkdir(dirname)
else:
    print "Removing old build of same version..."
    shutil.rmtree(dirname)
    os.mkdir(dirname)

os.makedirs(dirname + "/fomod")

# Generate BSA archive
print "Generating BSA archive..."
shutil.copy('./Archive CE.exe', './tmp/Archive CE.exe')
shutil.copy('./archive-builder.txt', './tmp/archive-builder.txt')
shutil.copy('./archive-manifest.txt', './tmp/archive-manifest.txt')

os.chdir("./tmp")
subprocess.call(['./Archive CE.exe', './archive-builder.txt'])
os.chdir("..\\")

# Copy files - Mod
shutil.copyfile("./Volkihar Knight.esp", dirname + "/dist/Volikihar Knight/Volkihar Knight.esp")
shutil.copyfile("./tmp/Volkihar Knight.bsa", dirname + "/Volikihar Knight/Volkihar Knight.bsa")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./Volkihar Knight " + zip_name_ver + " Release", format="zip", root_dir=dirname)
shutil.move("./Volkihar Knight " + zip_name_ver + " Release.zip", dirname + "/Volkihar Knight " + zip_name_ver + " Release.zip")
print "Created " + dirname + "/Volkihar Knight " + zip_name_ver + " Release.zip"

# Clean Up
print "Removing temp files..."
shutil.rmtree("./tmp")

print "Done!"
