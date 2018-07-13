import os
import os.path
import subprocess
import re
import csv
import zipfile
import shutil
import glob
import time
import sys
reload(sys)
sys.setdefaultencoding('utf-8')


logger = open("../logs.txt", "a")

class UCCTestLibrary(object):
    def __init__(self):
        self._ucc_command = "UCC"
        self._status = ''
        self._tmp_outdir = "output/tmp"
        self._log = ''

    def display_version(self):
        self._run_command('-v')

    def run_ucc(self, *args):
        self._run_command(*args)
        self._read_log()

    def response_should_be(self, expected_status):
        if expected_status != self._status:
            raise AssertionError("Expected response to be '%s' but was %s."
                    % (expected_status, self._status))

    def response_should_contain(self, expected_status):
        if expected_status not in self._status:
            raise AssertionError("Response '%s' does not contain '%s'."
                    % (self._status, expected_status))

    def response_should_not_contain(self, expected_status):
        if expected_status in self._status:
            raise AssertionError("Response '%s' contains '%s'."
                    % (self._status, expected_status))

    def response_should_match(self, expected_status):
        if not re.search(expected_status, self._status):
            raise AssertionError("Response '%s' does not contain '%s'."
                    % (self._status, expected_status))

    def _run_command(self, *args):
        t_start = time.time ()
        command = list(args)
        for c in command:
            logger.write (c + ' ')
        process = subprocess.Popen(command, stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
        self._status = process.communicate()[0].strip()
        t_end = time.time ()
        with open("time", "w") as f:
           f.write (str(t_end-t_start))

    def _read_log(self):
        for root, dirs, files in os.walk('./'):
            for file in files:
                if file.endswith('.log'):
                    filepath = os.path.join(root, file)
                    with open(filepath, 'r') as log:
                        self._log = log.read()

    def time_limit (self, limit):
        limit = float (limit)
        with open("time", "r") as f:
            real_time = float (f.read())
            if real_time > limit:
                raise Exception("Time limit exceeded. Execution time was '%s' and limit was '%s'."
                    % (str(real_time) , str(limit) )
                )

    def _parse_matched_pairs_file(self):
        with open('MatchedPairs.csv', 'r') as fh:
            csvr = csv.reader(fh)
            pairs = list(csvr)[8:]
            listA = [ pair[0] for pair in pairs if pair != 'NA']
            listB = [ pair[1] for pair in pairs if pair != 'NA']
            return [listA, listB]
        return [None, None]

    def _parse_output_files(self, fn):
        with open(fn,'r') as fh:
            csvr = csv.reader(fh)
            rows = list(csvr)[13:]
            clist = []
            for row in rows:
                if len(row) > 10 and row[9] == 'CODE':
                    clist.append(row[10])
                else:
                    break
            return clist
        return None

    def baseline_a_output_should_contain(self, *files):
        [listA, listB] = self._parse_matched_pairs_file()
        listA = [ os.path.basename(fn) for fn in listA ]
        difference = set(files) - set(listA)
        if difference:
            raise AssertionError("Baseline A {%s} does not contain {%s}"
                    % (", ".join(listA), ", ".join(difference)))

    def baseline_b_output_should_contain(self, *files):
        [listA, listB] = self._parse_matched_pairs_file()
        listB = [ os.path.basename(fn) for fn in listB ]
        difference = set(files) - set(listB)
        if difference:
            raise AssertionError("Baseline B {%s} does not contain {%s}"
                    % (", ".join(listB), ", ".join(difference)))

    def default_output_should_contain(self, fn, *files):
        listA = self._parse_output_files(fn+'_outfile.csv')
        listA = [ os.path.basename(fn) for fn in listA ]
        difference = set(files) - set(listA)
        if difference:
            raise AssertionError("fileList.txt {%s} does not contain {%s}"
                    % (", ".join(listA), ", ".join(difference)))

    def default_output_should_not_contain(self, fname, *files):
        listA = self._parse_output_files(fname+'_outfile.csv')
        listA = [ os.path.basename(fn) for fn in listA ]
        for filename in files:
            if filename in listA:
                raise AssertionError("fileList.txt {%s} contains {%s}"
                    % (", ".join(listA), filename))

    def create_ucc_file_list(self, input_fn, *files):
        with open(input_fn, 'w') as fh:
            for fn in files:
                fh.write(fn+"\n")

    def add_to_ucc_file_list(self, input_fn, *files):
        with open(input_fn, 'a') as fh:
            for fn in files:
                fh.write(fn+"\n")

    def create_ucc_file_list_single(self, input_fn, *files):
        with open(input_fn, 'w') as fh:
            for fn in files:
                fh.write(fn+" ")

    def create_ucc_full_path_file_list(self, input_fn, *files):
        with open(input_fn, 'w') as fh:
            for fn in files:
                fh.write(os.path.abspath(fn)+"\n")

    def create_baseline_a_file_list(self, *files):
        self.create_ucc_file_list('fileListA.txt', *files)

    def create_baseline_b_file_list(self, *files):
        self.create_ucc_file_list('fileListB.txt', *files)

    def create_default_file_list(self, *files):
        self.create_ucc_file_list('fileList.txt', *files)

    def add_to_default_file_list(self, *files):
        self.add_to_ucc_file_list('fileList.txt', *files)

    def create_full_path_baseline_a_file_list(self, *files):
        self.create_ucc_full_path_file_list('fileListA.txt', *files)

    def create_full_path_baseline_b_file_list(self, *files):
        self.create_ucc_full_path_file_list('fileListB.txt', *files)

    def create_full_path_default_file_list(self, *files):
        self.create_ucc_full_path_file_list('fileList.txt', *files)


    def response_status_check(self, sdump, error, warn, info, ufile):
        if not re.search("Stack Dumps:  " + sdump.strip(), self._log):
            raise AssertionError("Expected '%s' stack dumps not in response '%s'."
                    % (sdump, self._log))
        if not re.search("Errors:  " + error.strip(), self._log):
            raise AssertionError("Expected '%s' errors not in response '%s'."
                    % (error, self._log))
        if not re.search("Warnings:  " + warn.strip(), self._log):
            raise AssertionError("Expected '%s' warnings not in response '%s'."
                    % (warn, self._log))
        if not re.search("Information:  " + info.strip(), self._log):
            raise AssertionError("Expected '%s' information not in response '%s'."
                    % (info, self._log))
        if not re.search("Uncounted Files:  " + ufile.strip(), self._log):
            raise AssertionError("Expected '%s' uncounted files not in response '%s'."
                    % (ufile, self._log))

    def is_ucc_response_error(self, msg):
        pos=self._status.find(msg)
        if pos==-1:
            raise AssertionError("Expected error '%s' not found '%s'"
                    % (msg, self._status))

    def ucc_count_results(self, nof, psloc, lsloc):
        with open('outfile_summary.csv', 'r') as fh:
            csvr = list(csv.reader(fh))
            for i in range(0,len(csvr)-1):
                row = csvr[i]
                if (len(row) > 0 and row[0] == "C_CPP"):
                    break
            row = csvr[i]
            if (int(nof) != int(row[1]) or int(psloc) != int(row[2]) or int(lsloc) != int(row[3])):
                raise AssertionError("Expected count values '%s' '%s' '%s' different from obtained '%s'"
                    % (nof, psloc,lsloc,','.join(row)))


    def ucc_diff_results(self, ncnt, dcnt, mcnt, ucnt):
        with open('outfile_diff_results.csv', 'r') as fh:
            csvr = list(csv.reader(fh))
            for i in range(0,len(csvr)-1):
                row = csvr[i]
                if (len(row) > 0 and row[0] == "Total New Lines"):
                    break
            row = csvr[i+1]
            if (int(ncnt) != int(row[0]) or int(dcnt) != int(row[1]) or int(mcnt) != int(row[2]) or int(ucnt) != int(row[3])):
                raise AssertionError("Expected diff values '%s' '%s' '%s' '%s' different from obtained '%s'"
                    % (ncnt, dcnt, mcnt, ucnt, ','.join(row)))

    def baseline_a_output_should_not_contain(self, *files):
        [listA, listB] = self._parse_matched_pairs_file()
        listA = [ os.path.basename(fn) for fn in listA ]
        for filename in files:
            if filename in listA:
                raise AssertionError("Baseline A {%s} contains {%s}"
                    % (", ".join(listA), filename))

    def baseline_b_output_should_not_contain(self, *files):
        [listA, listB] = self._parse_matched_pairs_file()
        listB = [ os.path.basename(fn) for fn in listB ]
        for filename in files:
            if filename in listB:
                raise AssertionError("Baseline B {%s} contains {%s}"
                    % (", ".join(listB), filename))

    def ucc_test_teardown(self, filename):
        test_outdir = os.path.join(self._tmp_outdir, filename)
        if not os.path.isdir(test_outdir):
            os.makedirs(test_outdir)
        output_files = [ filename for filename in os.listdir(".")
            if (os.path.isfile(filename) and filename not in
            glob.glob('execute_test*')) or (os.path.isdir(filename) and
            filename not in glob.glob('lang') and
            filename not in glob.glob('req') and
            filename not in glob.glob('ucc_exe*') and 
            filename not in glob.glob('output'))]
        for filename in output_files:
            #handle these cases in list comprehension above using glob.glob
            if not filename.endswith(".py"):
                shutil.move(filename, test_outdir)

    def sloc_check(self, psloc, lsloc):
        with open('outfile_summary.csv','r') as fh:
            csvr = csv.reader(fh)
            rows = list(csvr)[6:]
            for i in range(len(rows)):
                if len(rows[i]) > 3 and rows[i][2] == 'Physical':
                    fh_psloc = rows[i+2][2]
                if len(rows[i]) > 3 and rows[i][3] == 'Logical':
                    fh_lsloc = rows[i+2][3]
                    break
            if fh_psloc != str(psloc) or fh_lsloc != str(lsloc):
                raise Exception("Wrong SLOC results. Excepted Physical SLOC, Logical SLOC to be '%s', '%s', but were '%s', '%s'."
                    % (str(psloc) , str(lsloc), fh_psloc, fh_lsloc)
                )

    def log_should_contain(self, expected_status):
        if expected_status not in self._log:
            raise AssertionError("Log '%s' does not contain '%s'."
                % (self._log, expected_status))

    def log_should_match(self, expected_status):
        if not re.search(expected_status, self._log):
            raise AssertionError("Log '%s' does not contain '%s'."
                    % (self._log, expected_status))

    def get_absolute_path(self, path):
        return os.path.abspath(path)
