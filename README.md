# Loadflow analysis in scilab using Newton Raphson and Gauss Seidel algorithms
The files are capable of performing load-flow analysis in Newton Raphson methond and Gauss Siedel Method in Scilab.
It can also print the results into a text file named `Report.txt` in the same folder.

It can work only on scilab 6.0.0.

## Developed and integrated by:

1. Abhinav Dronamraju
2. Tushar Bang, in association with FOSSEE, IIT Bombay. 

## How to use:

1. Clone this repo to a folder of your convenience

2. Make changes in linedatas.sci and busdatas.sci according to your loadflow problem, save and exit.

3. Open scilab and `cd` to the folder of the repo.

4. Execute start.sci by typing -> `exec start.sci`

5. Call the start.sci function with the choice of algorithm.
    #### Keywords
      1. 'nr'  - Newton Raphson Method
      2. 'gs'  - Gauss Seidel Method
      3. 'report' - Generate `Report.txt` with the results.
 
6. Calling the function as `start('nr')` or `start('gs')` will post the results in the console.

7. Calling the function as `start('nr', 'report')` or `start('gs', 'report')` will print the results in the `Report.txt`. 

## Things to remember:

1. Base MVA is set to 100 MVA.

2. You can change this default setting, go to `gauss.sci` and `nrlf.sci`, change the value of BMva.
 
