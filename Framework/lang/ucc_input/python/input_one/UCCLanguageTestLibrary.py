import os
import subprocess
import sys
import re
import csv
import pdb


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
        self._status = ''

        self.f = open('cpp_counting_flag.csv', 'wt')
        self.writer = csv.writer(self.f)
        self.writer.writerow( ('Requirement Name', 'Status', 'Modules Tested') )

    def __del__(self):
        self.f.close()
            
    def ucc_parse_cpp(self,version,path):
        with open( path+ '\\C_CPP_outfile.csv', 'r') as fh:
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
            #self.writer.writerow((i,csvr[i]))         

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

    def ucc_total_lines(self):
        if( self.cpp_result1['total_lines']==self.cpp_result2['total_lines']):
            self.writer.writerow( ("Total Lines", 'Yes','None') )
        else:
            self.writer.writerow( ("Total Lines", 'No',self.cpp_result1["Module Name"]) )

    def ucc_total_lines(self):
        if( self.cpp_result1['total_lines']==self.cpp_result2['total_lines']):
            self.writer.writerow( ("Total Lines", 'Yes','None') )
        else:
            self.writer.writerow( ("Total Lines", 'No',self.cpp_result1["Module Name"]) )

    def ucc_total_lines(self):
        if( self.cpp_result1['total_lines']==self.cpp_result2['total_lines']):
            self.writer.writerow( ("Total Lines", 'Yes','None') )
        else:
            self.writer.writerow( ("Total Lines", 'No',self.cpp_result1["Module Name"]) )
            
    def display_version(self):
        self._run_command('-v')

    def run_ucc(self, *args):
        self._run_command(*args)

    def _run_command(self, *args):
        command = list(args)
        process = subprocess.Popen(command, stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
        self._status = process.communicate()[0].strip()

    def create_ucc_file_list(self, input_fn, *folders):
        with open(input_fn, 'w') as fh:
            for path in folders:
                for fn in os.listdir(path):
                    fh.write(path+"/"+fn+"\n")
           # for fn in files:
                

        
                
    
        
				
 
