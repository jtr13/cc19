# cc19 [IT'S NOT DONE YET. DO NOT FORK NOW]
Community contributions for STAT GR 5702 Fall 2019

The class projects will be collected as a bookdown page. You can visit [this link](https://jtr13.github.io/cc19/) to see how it will look like. 

## Submission Steps

### Submitting .Rmd files

To submit your work, we will be following the instructions in [this tutorial](https://edav.info/github.html#st-pr-on-another-repo-with-branching), which are provided in abbreviated form below, with specific instructions on naming conventions, content information, and other important details.

Before you begin, create a concise, descriptive name for your project. For instance, name it `base_r_ggplot_graph` or something similar if your work is about constrasting/working with base R graphics and **ggplot2** graphics. Your project name should be words only and joined with underscores, i.e. **Do not include whitespace in the name.**  We will use `sample_project` as the project name in this tutorial. The project name will be used both for naming the branch on which we will work, and also for the .Rmd file name.

1. Fork [cc19 repo (this repo)](https://github.com/jtr13/cc19) to your GitHub account. 

2. Clone/download the forked repo to your local computer.

3. Create a new branch and name it with your project name, in our case `sample_project`. 

4. Create an `.Rmd` file with the same name. In our example, it is [`sample_project.Rmd`](sample_project.Rmd). Put it in the root directory of the repo. With regard to content of this file, you should refer to the instructions of this homework on coursework. Two more details on this file: 

    a. No YAML header
    
    b. The first line should be your project name (this does not have to be exact same as the project folder name and may include white space). Use one \# to indicate that it is a header. One \# header must not be used anywhere else in the document.
    
    c. The second line should be blank. For example:
    
   ```
    # Base R graphics vs. ggplot2 graphics

    Your content starts here. 
   ```
   
5. Do not include an `.html` file. (In order for the **bookdown** package to work, all `.Rmd` files will be rendered simultaneously behind the scenes.)

6. [OPTIONAL] If you have other resources (such as images) included in your project, create a folder under `resources/`. In our example, it is [`resources/sample_project/`](resources/sample_project). Put the resources files there. 

7. When you are ready to submit your project, push your branch to your remote repo. Follow [this tutorial](https://help.github.com/en/articles/creating-a-pull-request-from-a-fork) to create a pull request. If you follow the steps, we will merge it to the master branch. 

## FAQ

### What should I expect after creating a pull request? 

1. Within a week after you create a pull request, we will apply a label to it and assign an administrater who will review all the files you submit to see if they meet the requirements. 

2. It will take some time before we can process all the pull requests, so as long as you see your pull request has been labeled and assigned to an administrater, don't worry. 

3. However, if the admin contacts you regarding the pull request, that usually means your files fail to meet some requirements. The admin will clearly state what is wrong, so please fix them as soon as possible. 

### Other questions

If you encounter other problems, please [submit an issue](https://github.com/jtr13/cc19/issues) and we will look into it. 

Thank you for your contributions!
