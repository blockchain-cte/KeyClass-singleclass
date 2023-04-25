import subprocess

base_filename = "config_mimic_"
base_file_extension = '.yaml'

for i in range(1,20):
    filename = base_filename + str(i) + base_file_extension
    print("Running ",filename)
    subprocess.run(["python","run_all.py","--config",filename])