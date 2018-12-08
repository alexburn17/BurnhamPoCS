## Homework 7 - PoCS

P. Alexander Burnham

October 22, 2018

Worked with: Yu, Edison and Kewang 



**Question 1:**

**A)**

Step 1: frame problem

$p \geq (x) = \int_{x}^{\infty}p(x)dx=cx^{-q}$

$P\geq (A)=p\geq(p^{-1}(a^{-\gamma}))$

Step 2: solve for x and simplify

$P(x) = cx^{-(q+1)}$

$x=(\frac{p(x)}{c})^{(\frac{1}{-(q+1)})}$

$(\frac{x}{c})^{(\frac{1}{-q+1})}=p^{-1}q$



Step 3: Sub in $A^{-\gamma(1-1/q)}$ and simplify

$c((\frac{A^{-\gamma}}{c})^{(\frac{-1}{q+1})})^{-q}=x$

$=c\Bigg(\frac{A^{-\gamma(\frac{q}{q+1})}}{c^{(\frac{q}{q+1})}}\Bigg)$

$=c^{1-(\frac{q}{q+1})}A^{-\gamma(\frac{q}{q+1})}$

$=c^{(\frac{1}{q+1})}A^{-\gamma(\frac{q}{q+1})}$



**B)**

Step 1: solve for x and simplify 

$P(x)=ce^{-x}$

$\frac{x}{c}=e^{-p^{-1}}(x)$

$ln(\frac{x}{c})=-p^{-1}(x)$

Step 2: Find $P\geq (A)$

$P\geq (A)=ce^{-(-ln\frac{A^{-\gamma}}{c})}$

$=ce^{ln\frac{q-\gamma}{c}}$

$=c\frac{A^\gamma}{c}$

$=A^\gamma$ plug into above for x

Step 3: plug in 

$p^{-1}(A^{-\gamma})=-ln(\frac{A^{-\gamma}}{c})$



**C)**

Step 1: sub $A^{-\gamma}[ln(A)]^{-1/2}$ for $x$ below and simplify

$P\geq(x) =cx^{-1}e^{-x^2}$

$P\geq(A) =c(\sqrt{\frac{-lnA^{-\gamma}}{c}})^{-1}e^{-(\sqrt{\frac{-lnA^{-\gamma}}{c}})^2}$

$=\frac{c}{\sqrt{\frac{-lnA^{-\gamma}}{c}}}e^{-(-ln\frac{A^{-\gamma}}{c})}$

$=\frac{c}{\sqrt{\frac{-lnA^{-\gamma}}{c}}}\frac{A^{-\gamma}}{c}$

$=A^{-\gamma}(-ln(\frac{A^{-\gamma}}{c}))^{-1/2}$



**Question 2:**

Step 1: set up equation

$L=\sum p_ia_i + \lambda(\sum a_i\frac{d-1}{d}a_i^{-1}-C)$

Step 2: Take partial derivative with respect to $a_i$ and set equal to $0$

$\frac{\part L}{\part a_i}=p_i+\lambda(\frac{d-1}{d}a_i^{\frac{d-1}{d}-1}a_i^{-1}+a_i^{\frac{d-1}{d}}(-1)a_i^{-2})=0$

Step 2: Factor out $a_i^{\frac{d-1}{d}}$ and $a_i^{-2}$ 

$p_i=-\lambda a_i^{\frac{d-1}{d}}(\frac{d-1}{d}a_i^{-2}-a_i^{-2})$

$=-\lambda a_i\frac{d-1}{d}^{-2}(\frac{d-1}{d}-1)$

Step 3: cancel constants and set proportional

$=\frac{\lambda}{d}a_i^{\frac{-d-1}{d}}$

$=\frac{\lambda}{d}a_i^{-1-\frac{1}{d}}$

$p_i \propto a_i^{-1-\frac{1}{d}}$



**Question 3:** Completed with L=32, upgrading to a faster computer soon.

**A)**



D=1

![D=1](/Users/phillipburnham/Desktop/D=1.tiff)

D=10:

![D=10](/Users/phillipburnham/Desktop/D=10.tiff)

**B)**



![DsHW8](/Users/phillipburnham/Desktop/DsHW8.tiff)



* When $D=1$, $p_{max}=0.58$ and $Y_{max}=0.39$ 
* When $D=2$, $p_{max}=0.625$ and $Y_{max}=0.625$ 
* When $D=10$, $p_{max}=0.81$ and $Y_{max}=0.75$ 

**C)** Power Law distributions at peak yield



![Rplot](/Users/phillipburnham/Desktop/Rplot.tiff)



**D)** Did not attempt as it is optional and I have my comprehensive exam and a NSF proposal decline coming up in 10 days! Sounded interesting though.



