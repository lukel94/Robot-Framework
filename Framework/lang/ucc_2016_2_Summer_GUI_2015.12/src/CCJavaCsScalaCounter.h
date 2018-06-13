//! Code counter class definition for the C/C++, Java, and C# languages.
/*!
* \file CCJavaCsCounter.h
*
* This file contains the code counter class definition for the C/C++, Java, and C# languages.
*/

#ifndef CCJavaCsScalaCounter_h
#define CCJavaCsScalaCounter_h

#include "CCodeCounter.h"

//! C/C++, Java, C# and Scala code counter common base class.
/*!
* \class CCJavaCsCounter
*
* Defines the C/C++, Java, C# and Scala code counter class.
*/
class CCJavaCsScalaCounter : public CCodeCounter
{
public:
	CCJavaCsScalaCounter( string lang = "LANGUAGE_NOT_SET" );

protected:
	virtual int CountDirectiveSLOC(filemap* fmap, results* result, filemap* fmapmBak = NULL);
	virtual int LanguageSpecificProcess(filemap* fmap, results* result, filemap* fmapmBak = NULL);
	void LSLOC(results* result, string line, size_t lineNumber, string lineBak, string &strLSLOC, string &strLSLOCBak,
		unsigned int &paren_cnt, bool &forflag, bool &found_forifwhile, bool &found_while, char &prev_char, bool &data_continue,
		unsigned int &temp_lines, unsigned int &phys_exec_lines, unsigned int &phys_data_lines,
		bool &inArrayDec, bool &found_for, unsigned int &openBrackets, StringVector &loopLevel);
	virtual int ParseFunctionName(const string &line, string &lastline,
		filemap &functionStack, string &functionName, unsigned int &functionCount);

private:
// This class is NOT copied or assigned to.
// Avoid copying of this class.  Avoid assignment of this class.
// Compiler will give an Error if a copy or assignment is done and those Errors do NOT happen.
// This avoids a VC++ -W4 or -Wall warning C4625, C4626

	// Take care of warning C4625: 'CCJavaCsScalaCounter' : copy constructor could not be generated because a base class copy constructor is inaccessible
	CCJavaCsScalaCounter(const CCJavaCsScalaCounter& rhs);

	// Take care of warning C4626: 'CCJavaCsScalaCounter' : assignment operator could not be generated because a base class assignment operator is inaccessible
	CCJavaCsScalaCounter operator=(const CCJavaCsScalaCounter);
};

#endif
