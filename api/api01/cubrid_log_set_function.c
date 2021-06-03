#include <stdio.h>
#include <stdlib.h>

#include "cubrid_log.h"

int
main (int argc, char *argv[])
{
  char *host;
  char *dbname;
  int port;

  if (argc != 4)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  host = argv[1];
  port = atoi (argv[2]);
  dbname = argv[3];

  if (cubrid_log_set_connection_timeout (-2) != CUBRID_LOG_INVALID_CONNECTION_TIMEOUT)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  if (cubrid_log_set_extraction_timeout (-2) != CUBRID_LOG_INVALID_EXTRACTION_TIMEOUT)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  if (cubrid_log_set_max_log_item (-2) != CUBRID_LOG_INVALID_MAX_LOG_ITEM)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  if (cubrid_log_set_all_in_cond (-2) != CUBRID_LOG_INVALID_RETRIEVE_ALL)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  ///////////////////////////////////////////////////////////////////////////////////////////////

  if (cubrid_log_set_connection_timeout (360) != CUBRID_LOG_SUCCESS)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  if (cubrid_log_set_extraction_timeout (360) != CUBRID_LOG_SUCCESS)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  if (cubrid_log_set_max_log_item (1024) != CUBRID_LOG_SUCCESS)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  if (cubrid_log_set_all_in_cond (1) != CUBRID_LOG_SUCCESS)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
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
