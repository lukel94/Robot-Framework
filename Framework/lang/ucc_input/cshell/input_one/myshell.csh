/**
 * Made by Riku Kenju (301067011)
 * For CMPT300 Assignment 1
 *
 * Building a simple shell in C.
 * The assignment was essentially 2 parts.
 * 1, parse the input from user and correctly put them into an array.
 * 2, correctly execute the commands with arguments.
 *
 * fork(), waitpid(), execvp() were used per requirement.
 */

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>


int main(int argc, char *argv[]){
	int defaultSize = 50;
	char buffer[defaultSize]; //stores inputs
	char *p;//this pointer will be used for cmd array
	pid_t pid; //child ID
	char *cmd[50]; //to store command and argument
	int i, status;

	while(1){
		printDateTime();//print out the date and time
		fgets(buffer, defaultSize, stdin);// get user input
		p = strtok(buffer, " \n"); //split the input line using delimiter " " and "\n"
		//"\n" is automatically added after the last argument, this will cause error and thus should be considered as delimiter

		i = 0;

		while(p != NULL){
			cmd[i++] = p; //cmd[0] stores command, cmd[n] stores nth argument (n > 0)
			p = strtok(NULL, " \n");
		}

		cmd[i] = NULL; //terminate argument list with NULL or it won't work!

		if (!strcmp(cmd[0], "exit")) exit(0);//if command was exit then terminate the program

		if (strcmp(cmd[0], "cd") == 0) chdir(cmd[1]);//implementation of cd command
		else {//other commands

			pid = fork();//spawn new child process

			if (pid < 0){//fork error if pid is -1
				printf("Something bad happened!!");
				exit(-1);
			}

			else if(pid > 0){//if pid is bigger than 0 wait for child process to finish
				waitpid(pid, &status, 0);

			}else{
				if (execvp(cmd[0], cmd)) printf("execution error!");
				//execvp will only return value if there was an error executing
				exit(-1);
			}
		}
	}
	return(0);

}

/**
 * This function handles printing out date and time in the specified format
 */
void printDateTime()
{
	time_t currentTime;
	int defaultSize = 50;
	struct tm *date;
	char output[defaultSize];	//array to store time
	currentTime = time(NULL);
	date = localtime(&currentTime); //get current time

	strftime(output, 100, "%x %X #",date); //specify time format

	printf("%s" , output);
}


