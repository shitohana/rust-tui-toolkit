If you want to contribute to this project, please follow these steps:

1. Fork the repository on GitHub.
2. Clone your forked repository to your local machine.
3. Create a new branch for your changes.
4. Make your changes and commit them.
5. Push your changes to your forked repository.
6. Create a pull request on GitHub.

To add new tool, follow these steps:

1. Add tool installation script into /install/01-cli-tools.sh
2. Add tool config files symlink into /install/02-configs.sh
3. Add tool directory in /configs folder. If there is no configuration file
   create a empty file named .placeholder
4. Add tool discription to /bin/tool-help
5. All done!

*Added tools should be installed when running /install.sh, i.e. they should not
be installed as complete binary or directory, but as a script or a symlink.*
