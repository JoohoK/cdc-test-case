#include <stdio.h>
#include <stdlib.h>

#include "cubrid_log.h"

int
main (int argc, char *argv[])
{
  char *host;
  char *dbname;
  int port;
  int max_log_item;
  int ret; 

  if (argc != 5)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  host = argv[1];
  port = atoi (argv[2]);
  dbname = argv[3];
  max_log_item = atoi(argv[4]);

  ret = cubrid_log_set_max_log_item (max_log_item);
  if (ret != CUBRID_LOG_SUCCESS)
    {
      printf("{ERROR_CODE] : %d \n", ret);
      printf ("[ERROR] %s:%d | return code : %d \n", __FILE__, __LINE__, ret);
      exit (-1);
    }

  if (cubrid_log_connect_server (host, port, dbname) != CUBRID_LOG_SUCCESS)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  cubrid_log_finalize ();

  printf ("[SUCCESS] %s\n", __FILE__);

  return 0;
}
