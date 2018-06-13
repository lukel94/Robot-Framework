
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <pthread.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "cshell_register.h"

cshell_handle_t *cshell_handle;

/* 发送注册成功的命令到外部(telnet) */
void _cshell_send_cmd_list_to_outside()
{
    char wbuf[CMD_LEN_MAX + DESCRIPTION_LEN_MAX] = {'\0'};
    cmd_list_node_t *cmd_node = NULL;

    sprintf(wbuf, "Registered command:\n");
    write(cshell_handle->s_handle->clr.c_fd, wbuf, strlen(wbuf));

    cmd_node = cshell_handle->cmd_header->cmd_node_1st;
    while(cmd_node != NULL)
    {
        memset(wbuf, 0, sizeof(wbuf));
        sprintf(wbuf, "* - [%s] \t %s\n", cmd_node->st_cmd.cmd, cmd_node->st_cmd.desc);
        write(cshell_handle->s_handle->clr.c_fd, wbuf, strlen(wbuf));
        cmd_node = cmd_node->next;
    }
}

/* 监听线程 */
void *_cshell_pthread_monitor(void *arg)
{
    string_cmd_t *cmd = NULL;
    cmd_t *st_cmd = NULL;

    signal(SIGCHLD, SIG_IGN);

    while(1)
    {
        while(!READ_ADDR_FROM_BUFFER(cshell_handle->s_handle->s_rb.qbusy, cmd, string_cmd_t *))
        {
            usleep(100);
        }

        if(vfork() == 0)
        {
            if(cshell_find_cmd_at_list(cshell_handle->cmd_header, cmd->strcmd, &st_cmd) == LIST_S_SUCCESS)
            {
                dup2(cshell_handle->s_handle->clr.c_fd, 0);
                dup2(cshell_handle->s_handle->clr.c_fd, 1);
                dup2(cshell_handle->s_handle->clr.c_fd, 2);

                (*(st_cmd->fun))(st_cmd->arg);
            }
            else
            {
                _cshell_send_cmd_list_to_outside();
            }
            exit(0);
        }

        write(cshell_handle->s_handle->clr.c_fd, ">", strlen(">"));
        while(!WRITE_ADDR_TO_BUFFER(cshell_handle->s_handle->s_rb.qfree, cmd))
        {
            usleep(100);
        }
    }
    return arg;
}

LONG cshell_init(uint32_t port)
{
    pthread_t pid_monitor;

    cshell_handle = (cshell_handle_t *)malloc(sizeof(cshell_handle_t));
    if(NULL == cshell_handle)
    {
        return CSHELL_W_INIT_FAILED;
    }
    memset(cshell_handle, 0, sizeof(cshell_handle_t));

    if(cshell_create_server_handle(&cshell_handle->s_handle) != SERVER_S_SUCCESS)
    {
        return CSHELL_W_INIT_FAILED; 
    }

    if(cshell_create_cmd_list_header(&cshell_handle->cmd_header) != LIST_S_SUCCESS)
    {
        return CSHELL_W_INIT_FAILED;
    }

    pthread_create(&pid_monitor, NULL, _cshell_pthread_monitor, NULL);
    cshell_server_install(cshell_handle, port);

    return CSHELL_S_SUCCESS;
}

/* 命令注册 */
void cshell_cmd_register(char *cmd, char *desc, void (*fun)(void *), void *arg)
{
    usleep(9000);
    cshell_insert_cmd_to_list(cshell_handle->cmd_header, cmd, desc, fun, arg);
}