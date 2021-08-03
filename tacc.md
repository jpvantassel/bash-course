# Machine Learning & HPC

- Mass storage
  - more data available
- Faster computations
  - more and faster memory
  - ability to scale

Scalable Computational Intelligence Group (SCI) @ TACC
help users utilize TACC resources

## Linux

Clone of unix
100% of hpc uses Linux
TACC uses CentOS

Bottom
Hardware: CPU, Hard Dish, GPU
Kernel: Manages hardware (lowest level software)
Application Layer: Libraries & tools

Shell: special interactive process

Secure Shell (ssh)
secure way to connect to a remote machine

Three LUSTRE file systems
- $HOME
  - 25 GB, backed up
  - for majority of your work
- $WORK
  - 1 TB, not backed up
  - for data preparation
- $SCRATCH
  - No Quota, subject to purge (fast io)
  - for large and fast input/output

Running Jupyter
https://vis.tacc.utexas.edu
Project:
Type:
Reservation ID:
Queue:

__/bin__: non-essential binaries
__/sbin__: system binaries
__/dev__: folders for devices
__/etc__: configuration files
__/home__: user specific folders
__/opt__: software add-on packages
__/var__: holds spooling data

man <command name>: manual for command
hostname: show user name
hostname -i: show ip address of machine
touch: create new file if not present
tree <directory name>: shows directory tree
ping <hostname>: check connectivity
du -sh: disk usage of current folder
wc <filename>: count lines, words, and characters
grep "pattern" filename: search for patterns in filename
|: "pipe"; can chain together commands
>: "redirect"; output redirection
top: view live processor load
ps -u <username>: processes owned by you

scp -r <local folder name> user@frontera.tacc.utexas.edu

File permissions

individual permission bits:
read - r
write - w
execute - x

levels:
user - rwx
group - rwx
others - rwx

ls -l to view permissions
chmod <permission modes> <filename>

module
module spider <package>: find more information
module load <package>: load a module
module save <name>: saves module configuration to name
module restore <name>: load module configuration from name
module list: list out currently loaded modules

bash scripting
<name>.sh
#!/bin/bash
chmod +x <name>.sh
see special variables**

command substitutions - can define a function to a variable

