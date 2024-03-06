<h1 align="center">R All Over It</h1>
<p align="center"><i>Introduction to R on some Jupyter notebooks. Based on the DMA Unit 2 course @ Sapienza</i></p>

---

In order to make the Jupyter Notebooks run, it's important to install the `R` kernel. In order to do so, I followed these steps (mind that some of them might not be necessary, but in order to have a self-contained envorinment they might prove to be useful):
 1. Install `R` from [here](https://www.r-project.org/);
 2. Install Anaconda or Miniconda;
 3. Create a virtual environment;
    1. Install the following packages with `conda`:
       
         ```zsh
         conda install python=3.7.13 r pip
         ```
    2. Install the following packages with `pip`:
         ```zsh
         pip install jupyterlab notebook
         ```
    2. Install the following packages on `R`:

         ```R
         install.packages("jsonlite")
         install.packages("IRkernel")
         ```
 4. Run the following command on `R`:
    ```R
    IRkernel::installspec()
    ```
> [!WARNING]  
> If the previous command gives you an error, try to do the following:
>  1. Open a terminal and run as an administrator the `R` console;
>    ```zsh
>    sudo R
>    ```
>  2. Run the following commands:
>    ```R
>    install.packages("devtools")
>    devtools::install_github("IRkernel/IRkernel")
>    IRKernel::installspec()
>    ```
> Now VSC should be able to recognize the `R` kernel. You can proceed with step 5

 5. Open VSC and create a new Jupyter file. When prompted to select a kernel, go to

      `Select Another Kernel...` → `Jupyter Kernel...` → `R`
 7. That's it! Enjoy using `R` on a Jupyter notebook!
