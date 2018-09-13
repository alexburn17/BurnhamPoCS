**Problem 1:**

Step 1:

$$ Pr(X \leq x) = \int_{a}^{x} P(x)dx $$

Step 2:

$$ P(x) \propto x^{-\gamma a}$$

$$ P(x) =cx^{-\gamma}$$

Step 3:

$$ \int_{a}^{b} P(x)dx=1$$

Step 4:

$$c\int_{a}^{b} x^{-\gamma}dx=1$$

Step 5:

$$c\frac{x^{-\gamma + 1}}{-\gamma+1}|^b_a = 1$$

Step 6:

$$c\frac{b^{-\gamma + 1}}{-\gamma+1}-c\frac{a^{-\gamma + 1}}{-\gamma+1} = 1$$

Step 6: Simplify 

$$c\frac{-\gamma + 1}{b^{1-\gamma}-a^{1-\gamma}} = 1$$

Step 6: solve for C

$$c = \frac{\gamma - 1}{b^{1-\gamma}-a^{1-\gamma}}$$



**Problem 2:**

Step 1: Integrate p(x) and x^n^ to find the n^th^ moment

$$P(x) = x^ncx^{-\gamma} $$

$$\int_{a}^{b} x^nP(x)dx$$

Step 2:

$$\int_{a}^{b} x^ncx^{-\gamma}dx$$

Step 3: Simplify and integrate

$$c\int_{a}^{b} x^{n-\gamma}dx$$

Step 4: substitute in a and b

$$c\frac{x^{n-\gamma + 1}}{n-\gamma+1}|^b_a $$

Step 5: Simplify 

$$c\frac{b^{n-\gamma + 1}}{n-\gamma+1}-c\frac{a^{n-\gamma + 1}}{n-\gamma+1}$$

Step 5: simplify n^th^ moment and add in expression for $c$

$$\frac{b^{1-\gamma + n}-a^{1-\gamma + n}}{1-\gamma+n}* \frac{\gamma - 1}{b^{1-\gamma}-a^{1-\gamma}}$$



**Problem 3:**

Step 1: take the limit as b goes to infinity 

$$\lim_{b\to\infty} \frac{b^{1-\gamma + n}-a^{1-\gamma + n}}{1-\gamma+n}* \frac{\gamma - 1}{b^{1-\gamma}-a^{1-\gamma}}$$

Step 2: the b terms go to infinity and are removed

$$\frac{a^{1-\gamma + n}}{1-\gamma+n}* \frac{\gamma - 1}{-a^{1-\gamma}}$$

Step 3: a terms cancel

$$\frac{(\gamma-1)a^n}{\gamma-n-1}$$

This means that when b goes to infinity, $\gamma>n+1$ and $a$ dominates

**Problem 4:**

$$\frac{b^{1-\gamma + n}-a^{1-\gamma + n}}{1-\gamma+n}* \frac{\gamma - 1}{b^{1-\gamma}-a^{1-\gamma}}$$

When $a \ll b$, $b$ dominates and $\gamma \leq n+1$

**Problem 5:**





**a)**

Step 1: 

$$var(x) = \E[(x)-(\E(x))^2] $$

$$\sigma^2 =  \E(x^2)-(\E(x))^2$$

Step 2: substitute in the n^th^ moment in for x and substitute in the appropriate exponent for n and simplify

 $$\sigma^2 = \frac{b^{3-\gamma}-a^{3-\gamma}}{3-\gamma}* \frac{1-\gamma}{b^{1-\gamma}-a^{1-\gamma}}- \left(\frac{b^{2-\gamma}-a^{2-\gamma}}{2-\gamma}* \frac{1-\gamma}{b^{1-\gamma}-a^{1-\gamma}}\right)^2$$

Step 3: Take the limit as b approaches infinity 

$$\lim_{b\to\infty} \frac{b^{3-\gamma}-a^{3-\gamma}}{3-\gamma}* \frac{1-\gamma}{b^{1-\gamma}-a^{1-\gamma}}- \left(\frac{b^{2-\gamma}-a^{2-\gamma}}{2-\gamma}* \frac{1-\gamma}{b^{1-\gamma}-a^{1-\gamma}}\right)^2$$

Step 4: b terms are removed and a terms simplify 

 $$\sigma^2 = \frac{-a^{3-\gamma}}{3-\gamma}* \frac{1-\gamma}{-a^{1-\gamma}}- \left(\frac{-a^{2-\gamma}}{2-\gamma}* \frac{1-\gamma}{-a^{1-\gamma}}\right)^2$$

 $$\sigma^2 = a^2\frac{1-\gamma}{3-\gamma} -a^2\frac{(1-\gamma)^2}{(2-\gamma)^2}$$

Step 5: factor a^2^ out and cross multiply

 $$\sigma^2 = a^2 \left(\frac{(1-\gamma)(2-\gamma)^2}{(3-\gamma)(2-\gamma)^2} -\frac{(3-\gamma)(1-\gamma)^2}{(3-\gamma)(2-\gamma)^2}\right)$$

Step 6: square, distribute, subtract and cancel the numerator 

$$(1-\gamma)(4-4\gamma+\gamma^2)-(3-\gamma)(1-2\gamma+\gamma^2)$$

$$4-4\gamma+\gamma^2-4\gamma+4\gamma^2-\gamma^3-(3-6\gamma+3\gamma^2-\gamma+2\gamma^2-\gamma^3)$$

$$numerator = 1-\gamma$$

 $$Yields:\sigma^2=\frac{1-\gamma}{(3-\gamma)(2-\gamma)^2}a^2$$

Step 6: multiply both sides of equation by negative 1 to get in the form described in the instructions:

$$\sigma^2=\frac{\gamma-1}{(\gamma-3)(\gamma-2)^2}a^2$$

* c~1~ = 1
* c~2~ = 3
* c~3~ = 2

Step 6: Take the square root of both sides to get the standard deviation $\sigma$

$$\sigma=\frac{a\sqrt{(\gamma-1)}}{\sqrt{(\gamma-3)}(\gamma-2)}a^2$$

 b)**

$$var(x) = \E[(x)-(\E(x))^2]$$

$$\sigma^2 =  \E(x^2)-(\E(x))^2$$