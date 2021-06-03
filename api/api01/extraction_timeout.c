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
#if 1 
  if (cubrid_log_set_extraction_timeout (370) != CUBRID_LOG_INVALID_EXTRACTION_TIMEOUT)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }
#endif

  ///////////////////////////////////////////////////////////////////////////////////////////////
#if 0
  if (cubrid_log_set_extraction_timeout (350) != CUBRID_LOG_SUCCESS)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }
#endif 
  if (cubrid_log_connect_server (host, port, dbname) != CUBRID_LOG_SUCCESS)
    {
      printf ("[ERROR] %s:%d\n", __FILE__, __LINE__);
      exit (-1);
    }

  cubrid_log_finalize ();

  printf ("[SUCCESS] %s\n", __FILE__);

  return 0;
}
