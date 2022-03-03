#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>


int main()
{
  int fd = -1;

  fd = open("test", O_RDWR | O_CREAT | O_EXCL, 0755);
  printf("fd:%d\n", fd);
  if (-1 == fd)
  {
    perror("test");
    if (EEXIST == errno)
    {
      fd = open("test", O_RDWR | O_APPEND, 0755);
      printf("fd:%d\n", fd);
    }
  }
  write(fd, "hello\n", 6);

  close(fd);

  return 0;
}
