import os
import subprocess
import sys
import re
import csv
import pdb
import shutil
import glob
import time
class UCCLanguageTestLibrary(object):

    ROBOT_LIBRARY_SCOPE = "TEST SUITE"

    def __init__(self):

        self.cpp_result = {}
        self.cpp_result1={}
        self.cpp_result2={}
        self.cpp_summary1={}
        self.cpp_summary2={}
        self.cpp_result['Total Lines']=[]
        self.cpp_result["Blank Lines"]=[]
        self.cpp_result["Whole Comments"]=[]
        self.cpp_result["Embedded Comments"]=[]
        self.cpp_result['Compiler Directive']=[]
        self.cpp_result['Data Decl']=[]
        self.cpp_result['Exec Instr']=[]
        self.cpp_result["Logical Sloc"]=[]
        self.cpp_result["Physical Sloc"]=[]
        self.cpp_result["File Type"]=[]
        self.cpp_result["Module Name"]=[]

        self.cpp_result1 = self.cpp_result
        self.cpp_result2 = self.cpp_result

        self.cpp_result['total_lines'] = None
        self.cpp_result['blank_lines'] = None
        self.cpp_result['whole_comments'] = None
        self.cpp_result['embedded_comments'] = None
        self.cpp_result['compiler_directive'] = None
        self.cpp_result['data_decl'] = None
        self.cpp_result['exec_instr'] = None
        self.cpp_result['logical_sloc'] = None
        self.cpp_result['physical_sloc'] = None
        self.cpp_result['counted_files'] = None
        self.cpp_result['accessed_files'] = None
        self.cpp_result['compiler_keywords']=0
        self.cpp_result['data_keywords']=0
        self.cpp_result['executable_keywords']=0
        self._status = ''

        self.f = open('cpp_counting_flag.csv', 'wt')
        self.writer = csv.writer(self.f)
        self.writer.writerow( ('Requirement Name', 'Status', 'Modules Tested') )

    def __del__(self):
        self.f.close()
            
    def ucc_parse_cpp(self,version,path):
        with open( path+ '/C_CPP_outfile.csv', 'r') as fh:
            csvr = list(csv.reader(fh))
            i = 11
            row = csvr[i]
            while( row ):
                self.cpp_result['Total Lines'].append(row[0])
                self.cpp_result["Blank Lines"].append(row[1])
                self.cpp_result["Whole Comments"].append(row[2])
                self.cpp_result["Embedded Comments"].append(row[3])
                self.cpp_result['Compiler Directive'].append(row[4])
                self.cpp_result['Data Decl'].append(row[5])
                self.cpp_result['Exec Instr'].append(row[6])
                self.cpp_result["Logical Sloc"].append(row[7])
                self.cpp_result["Physical Sloc"].append(row[8])
                self.cpp_result["File Type"].append(row[9])
                self.cpp_result["Module Name"].append(row[10])
                i=i+1
                row = csvr[i]
                #self.writer.writerow((i,csvr[i]))

            i=i+5
            row = csvr[i]
            self.cpp_result['physical_sloc'] = row[7]
            i=i+1
            row = csvr[i]
            self.cpp_result['total_lines'] = row[0]
            self.cpp_result['blank_lines'] = row[1]
            self.cpp_result['whole_comments'] = row[2]
            self.cpp_result['embedded_comments'] = row[3]
            self.cpp_result['compiler_directive'] = row[4]
            self.cpp_result['data_decl'] = row[5]
            self.cpp_result['exec_instr'] = row[6]
            self.cpp_result['logical_sloc'] = row[7]

            i=i+2
            row = csvr[i]
            self.cpp_result['counted_files'] = row[3]
            self.cpp_result['accessed_files'] = row[1]
            
        
            i=i+2
            row = csvr[i]
            self.cpp_result['psloc_to_lsloc_ratio'] = row[1]
        
            i=i+4
            row=csvr[i]
            while row:
                self.cpp_result['compiler_keywords']=self.cpp_result['compiler_keywords']+int(row[1])
                self.cpp_result['data_keywords']=self.cpp_result['data_keywords']+int(row[3])
                self.cpp_result['executable_keywords']=self.cpp_result['executable_keywords']+int(row[5])
                i=i+1
                row=csvr[i]
        

        if version=="version1":
            self.cpp_result1=self.cpp_result
        else:
            self.cpp_result2=self.cpp_result

                
    def ucc_total_lines_individual(self):
        if( self.cpp_result1['Total Lines']==self.cpp_result2['Total Lines']):
            self.writer.writerow( ("Total Lines Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Total Lines Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_blank_lines_individual(self):
        if( self.cpp_result1['Blank Lines']==self.cpp_result2['Blank Lines']):
            self.writer.writerow( ("Blank Lines Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Blank Lines Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_whole_comments_individual(self):
        if( self.cpp_result1['Whole Comments']==self.cpp_result2['Whole Comments']):
            self.writer.writerow( ("Whole Commments Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Whole Comments Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_embedded_comments_individual(self):
        if( self.cpp_result1['Embedded Comments']==self.cpp_result2['Embedded Comments']):
            self.writer.writerow( ("Embedded Comments Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Embedded Comments Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_compiler_directive_individual(self):
        if( self.cpp_result1['Compiler Directive']==self.cpp_result2['Compiler Directive']):
            self.writer.writerow( ("Compiler Directive Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Compiler Directive Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_data_decl_individual(self):
        if( self.cpp_result1['Data Decl']==self.cpp_result2['Data Decl']):
            self.writer.writerow( ("Data Decl Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Data Decl Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_exec_instr_individual(self):
        if( self.cpp_result1['Exec Instr']==self.cpp_result2['Exec Instr']):
            self.writer.writerow( ("Exec Instr Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Exec Instr Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_logical_sloc_individual(self):
        if( self.cpp_result1['Logical Sloc']==self.cpp_result2['Logical Sloc']):
            self.writer.writerow( ("Logical Sloc Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Logical Sloc Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_physical_sloc_individual(self):
        if( self.cpp_result1['Physical Sloc']==self.cpp_result2['Physical Sloc']):
            self.writer.writerow( ("Physical Sloc Individual", 'Yes','None') )
        else:
            self.writer.writerow( ("Physical Sloc Individual", 'No',self.cpp_result1["Module Name"]) )

    def ucc_file_type_individual(self):
        if( self.cpp_result1['File Type']==self.cpp_result2['File Type']):
            self.writer.writerow( ("File Type", 'Yes','None') )
        else:
            self.writer.writerow( ("File Type", 'No',self.cpp_result1["Module Name"]) )


    def ucc_total_lines(self):
        if( self.cpp_result1['total_lines']==self.cpp_result2['total_lines']):
            self.writer.writerow( ("Total Lines", 'Yes','None') )
        else:
            self.writer.writerow( ("Total Lines", 'No',self.cpp_result1["Module Name"]) )


    def ucc_blank_lines(self):
        if( self.cpp_result1['blank_lines']==self.cpp_result2['blank_lines']):
            self.writer.writerow( ("Blank Lines", 'Yes','None') )
        else:
            self.writer.writerow( ("Blank Lines", 'No',self.cpp_result1["Module Name"]) )

    def ucc_whole_comments(self):
        if( self.cpp_result1['whole_comments']==self.cpp_result2['whole_comments']):
            self.writer.writerow( ("Whole Commments", 'Yes','None') )
        else:
            self.writer.writerow( ("Whole Comments", 'No',self.cpp_result1["Module Name"]) )

    def ucc_embedded_comments(self):
        if( self.cpp_result1['embedded_comments']==self.cpp_result2['embedded_comments']):
            self.writer.writerow( ("Embedded Comments", 'Yes','None') )
        else:
            self.writer.writerow( ("Embedded Comments", 'No',self.cpp_result1["Module Name"]) )

    def ucc_compiler_directive(self):
        if( self.cpp_result1['compiler_directive']==self.cpp_result2['compiler_directive']):
            self.writer.writerow( ("Compiler Directive", 'Yes','None') )
        else:
            self.writer.writerow( ("Compiler Directive", 'No',self.cpp_result1["Module Name"]) )

    def ucc_data_decl(self):
        if( self.cpp_result1['data_decl']==self.cpp_result2['data_decl']):
            self.writer.writerow( ("Data Decl", 'Yes','None') )
        else:
            self.writer.writerow( ("Data Decl", 'No',self.cpp_result1["Module Name"]) )

    def ucc_exec_instr(self):
        if( self.cpp_result1['exec_instr']==self.cpp_result2['exec_instr']):
            self.writer.writerow( ("Exec Instr", 'Yes','None') )
        else:
            self.writer.writerow( ("Exec Instr", 'No',self.cpp_result1["Module Name"]) )

    def ucc_logical_sloc(self):
        if( self.cpp_result1['logical_sloc']==self.cpp_result2['logical_sloc']):
            self.writer.writerow( ("Logical Sloc", 'Yes','None') )
        else:
            self.writer.writerow( ("Logical Sloc", 'No',self.cpp_result1["Module Name"]) )

    def ucc_physical_sloc(self):
        if( self.cpp_result1['physical_sloc']==self.cpp_result2['physical_sloc']):
            self.writer.writerow( ("Physical Sloc", 'Yes','None') )
        else:
            self.writer.writerow( ("Physical Sloc", 'No',self.cpp_result1["Module Name"]) )

    def ucc_counted_files(self):
        if( self.cpp_result1['counted_files']==self.cpp_result2['counted_files']):
            self.writer.writerow( ("Counted Files", 'Yes','None') )
        else:
            self.writer.writerow( ("Counted Files", 'No',self.cpp_result1["Module Name"]) )

    def ucc_accessed_files(self):
        if( self.cpp_result1['accessed_files']==self.cpp_result2['accessed_files']):
            self.writer.writerow( ("Accessed Files", 'Yes','None') )
        else:
            self.writer.writerow( ("Accessed Files", 'No',self.cpp_result1["Module Name"]) )

    def ucc_psloc_to_lsloc_ratio(self):
        if( self.cpp_result1['psloc_to_lsloc_ratio']==self.cpp_result2['psloc_to_lsloc_ratio']):
            self.writer.writerow( ("PSLOC To LSLOC Ratio", 'Yes','None') )
        else:
            self.writer.writerow( ("PSLOC To LSLOC Ratio", 'No',self.cpp_result1["Module Name"]) )

    def ucc_compiler_keywords(self):
        if( self.cpp_result1['compiler_keywords']==self.cpp_result2['compiler_keywords']):
            self.writer.writerow( ("Compiler Keywords", 'Yes','None') )
        else:
            self.writer.writerow( ("Compiler Keywords", 'No',self.cpp_result1["Module Name"]) )


    def ucc_data_keywords(self):
        if( self.cpp_result1['data_keywords']==self.cpp_result2['data_keywords']):
            self.writer.writerow( ("Compiler Keywords", 'Yes','None') )
        else:
            self.writer.writerow( ("Compiler Keywords", 'No',self.cpp_result1["Module Name"]) )

    def ucc_executable_keywords(self):
        if( self.cpp_result1['executable_keywords']==self.cpp_result2['executable_keywords']):
            self.writer.writerow( ("Compiler Keywords", 'Yes','None') )
        else:
            self.writer.writerow( ("Compiler Keywords", 'No',self.cpp_result1["Module Name"]) )
    

    def display_version(self):
        self._run_command('-v')

    def run_ucc(self, *args):
        self._run_command(*args)

    def _run_command(self, *args):
        t_start = time.time ()
        command = list(args)
        process = subprocess.Popen(command, stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
        self._status = process.communicate()[0].strip()
        t_end = time.time ()
        with open("time", "w") as f:
            f.write (str(t_end - t_start))
            
    def time_limit (self, limit):
        with open ("time", "r") as f:
            real_time = float (f.read())
            limit = float (limit)
        if real_time > limit:
            raise Exception("Test case took " + str(real_time) + " seconds. But limit is: " + str(limit))

    def create_ucc_file_list(self, input_fn, *folders):
        with open(input_fn, 'w') as fh:
            for path in folders:
                for fn in os.listdir(path):
                    fh.write(path+"/"+fn+"\n")
           # for fn in files:
        
    def copy_files_to_directory(self, source_dir, destination_dir):
        if os.path.exists(destination_dir):
            shutil.rmtree(destination_dir, ignore_errors=True)
        os.mkdir(destination_dir)
        for filename in glob.glob(os.path.join(source_dir, '*.*')):
            shutil.copy(filename, destination_dir)
                

        
                
    
        
				
 
