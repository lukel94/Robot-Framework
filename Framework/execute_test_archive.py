import datetime
import glob
import re
import zipfile
import os
import os.path
import sys
import platform

team_name = sys.argv[1]
#print team_name
test_type = sys.argv[2]
#print test_type
system_name = platform.system()


tmp_dir = os.path.join("output", "tmp")
out_prefix = "output-" + team_name + "-" + test_type + "-" + system_name + "-" + datetime.date.today().strftime("%Y%m%d")
out_list = glob.glob("output/%s/%s-*.zip" % (team_name, out_prefix))
try:
    last_fn = out_list[-1]
    m = re.search('(\d{3}).zip$', last_fn)
    seq = int(m.group(1)) + 1
except:
    seq = 1
zip_fn = out_prefix + "-%03d" % seq + ".zip"

# print "Archiving output files to: " + os.path.join("output", zip_fn)
cwd = os.getcwd()
with zipfile.ZipFile(os.path.join("output/%s" % team_name, zip_fn), 'w',
        zipfile.ZIP_DEFLATED) as zipf:
    os.chdir(tmp_dir)
    for curdir, subdir, files in os.walk("."):
        for fn in files:
            zipf.write(os.path.join(curdir, fn))
os.chdir(cwd)
