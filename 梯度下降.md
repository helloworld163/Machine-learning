假设$h(x)$ 是要拟合的函数,$J(\theta)$ 是损失函数，假设要有 $h(\theta) = \sum\limits_{j=0}^n \theta_j x_j $ 

$J(\theta) = \frac{1}{2m} \sum\limits_{i=1} ^m (y^i-h_{\theta}(x^i))^2$ 

* 批量梯度下降： 

  1. 将$J(\theta)$ 对$\theta$ 进行求导，得到每一个$\theta$ 对应的梯度，在这里有m个样本，每个样本有n个分量

     $$\frac{\partial J(\theta)}{\partial \theta_j}=-\frac{1}{m} \sum\limits_{i=1}^m(y_i - h_{\theta}(x_i))x_{ij} $$

  2. 极小化风险函数，由此需要更新$\theta$ ，$$\theta_j  ’= \theta_j + \frac{1}{m} \sum\limits_{i=1}{m}(y_i - h_{\theta}(x_i))x_{ij}$$ 

* 随机梯度下降，通过每个样本来迭代更新一次