

```python
import pandas as pd
```


```python
pd.options.display.max_rows = 77
res = pd.read_csv('results.csv')
res
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Unnamed: 0</th>
      <th>name</th>
      <th>num_vertices</th>
      <th>time_0.1</th>
      <th>size_max_clique_0.1</th>
      <th>time_1.0</th>
      <th>size_max_clique_1.0</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>C1000.9</td>
      <td>1000</td>
      <td>185.63</td>
      <td>52</td>
      <td>2015.27</td>
      <td>54.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>C125.9</td>
      <td>125</td>
      <td>0.05</td>
      <td>30</td>
      <td>0.49</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>C2000.5</td>
      <td>2000</td>
      <td>322.74</td>
      <td>14</td>
      <td>2705.67</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>C250.9</td>
      <td>250</td>
      <td>0.38</td>
      <td>38</td>
      <td>11.37</td>
      <td>39.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>C500.9</td>
      <td>500</td>
      <td>4.24</td>
      <td>44</td>
      <td>89.23</td>
      <td>47.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>DSJC1000_5</td>
      <td>1000</td>
      <td>19.01</td>
      <td>14</td>
      <td>157.96</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>6</td>
      <td>DSJC500_5</td>
      <td>500</td>
      <td>1.28</td>
      <td>11</td>
      <td>11.66</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>7</td>
      <td>MANN_a27</td>
      <td>378</td>
      <td>8.27</td>
      <td>123</td>
      <td>61.86</td>
      <td>123.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8</td>
      <td>MANN_a45</td>
      <td>1035</td>
      <td>507.19</td>
      <td>335</td>
      <td>6154.56</td>
      <td>337.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>9</td>
      <td>MANN_a9</td>
      <td>45</td>
      <td>0.00</td>
      <td>15</td>
      <td>0.01</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>10</td>
      <td>brock200_1</td>
      <td>200</td>
      <td>0.08</td>
      <td>18</td>
      <td>1.54</td>
      <td>19.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>11</td>
      <td>brock200_2</td>
      <td>200</td>
      <td>0.04</td>
      <td>9</td>
      <td>0.56</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>12</th>
      <td>12</td>
      <td>brock200_3</td>
      <td>200</td>
      <td>0.05</td>
      <td>14</td>
      <td>0.72</td>
      <td>13.0</td>
    </tr>
    <tr>
      <th>13</th>
      <td>13</td>
      <td>brock200_4</td>
      <td>200</td>
      <td>0.07</td>
      <td>13</td>
      <td>0.82</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>14</th>
      <td>14</td>
      <td>brock400_1</td>
      <td>400</td>
      <td>2.07</td>
      <td>21</td>
      <td>26.44</td>
      <td>22.0</td>
    </tr>
    <tr>
      <th>15</th>
      <td>15</td>
      <td>brock400_2</td>
      <td>400</td>
      <td>2.78</td>
      <td>20</td>
      <td>19.19</td>
      <td>21.0</td>
    </tr>
    <tr>
      <th>16</th>
      <td>16</td>
      <td>brock400_3</td>
      <td>400</td>
      <td>1.88</td>
      <td>20</td>
      <td>31.33</td>
      <td>22.0</td>
    </tr>
    <tr>
      <th>17</th>
      <td>17</td>
      <td>brock400_4</td>
      <td>400</td>
      <td>2.96</td>
      <td>21</td>
      <td>19.03</td>
      <td>22.0</td>
    </tr>
    <tr>
      <th>18</th>
      <td>18</td>
      <td>brock800_1</td>
      <td>800</td>
      <td>16.81</td>
      <td>17</td>
      <td>181.63</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>19</th>
      <td>19</td>
      <td>brock800_2</td>
      <td>800</td>
      <td>17.41</td>
      <td>17</td>
      <td>175.39</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>20</th>
      <td>20</td>
      <td>brock800_3</td>
      <td>800</td>
      <td>20.56</td>
      <td>18</td>
      <td>162.28</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>21</th>
      <td>21</td>
      <td>brock800_4</td>
      <td>800</td>
      <td>15.47</td>
      <td>17</td>
      <td>173.13</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>22</th>
      <td>22</td>
      <td>c-fat200-1</td>
      <td>200</td>
      <td>0.01</td>
      <td>12</td>
      <td>0.01</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>23</th>
      <td>23</td>
      <td>c-fat200-2</td>
      <td>200</td>
      <td>0.01</td>
      <td>24</td>
      <td>0.02</td>
      <td>24.0</td>
    </tr>
    <tr>
      <th>24</th>
      <td>24</td>
      <td>c-fat200-5</td>
      <td>200</td>
      <td>0.03</td>
      <td>58</td>
      <td>0.05</td>
      <td>58.0</td>
    </tr>
    <tr>
      <th>25</th>
      <td>25</td>
      <td>c-fat500-1</td>
      <td>500</td>
      <td>0.06</td>
      <td>14</td>
      <td>0.07</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>26</th>
      <td>26</td>
      <td>c-fat500-10</td>
      <td>500</td>
      <td>0.29</td>
      <td>126</td>
      <td>0.55</td>
      <td>126.0</td>
    </tr>
    <tr>
      <th>27</th>
      <td>27</td>
      <td>c-fat500-2</td>
      <td>500</td>
      <td>0.08</td>
      <td>26</td>
      <td>0.09</td>
      <td>26.0</td>
    </tr>
    <tr>
      <th>28</th>
      <td>28</td>
      <td>c-fat500-5</td>
      <td>500</td>
      <td>0.15</td>
      <td>64</td>
      <td>0.22</td>
      <td>64.0</td>
    </tr>
    <tr>
      <th>29</th>
      <td>29</td>
      <td>gen200_p0.9_44</td>
      <td>200</td>
      <td>0.20</td>
      <td>33</td>
      <td>2.45</td>
      <td>35.0</td>
    </tr>
    <tr>
      <th>30</th>
      <td>30</td>
      <td>gen200_p0.9_55</td>
      <td>200</td>
      <td>0.19</td>
      <td>34</td>
      <td>2.43</td>
      <td>42.0</td>
    </tr>
    <tr>
      <th>31</th>
      <td>31</td>
      <td>gen400_p0.9_55</td>
      <td>400</td>
      <td>1.63</td>
      <td>40</td>
      <td>69.33</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>32</th>
      <td>32</td>
      <td>gen400_p0.9_65</td>
      <td>400</td>
      <td>1.70</td>
      <td>41</td>
      <td>60.50</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>33</th>
      <td>33</td>
      <td>gen400_p0.9_75</td>
      <td>400</td>
      <td>1.65</td>
      <td>41</td>
      <td>34.10</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>34</th>
      <td>34</td>
      <td>hamming10-2</td>
      <td>1024</td>
      <td>176.39</td>
      <td>277</td>
      <td>2391.11</td>
      <td>307.0</td>
    </tr>
    <tr>
      <th>35</th>
      <td>35</td>
      <td>hamming10-4</td>
      <td>1024</td>
      <td>104.68</td>
      <td>31</td>
      <td>1005.45</td>
      <td>32.0</td>
    </tr>
    <tr>
      <th>36</th>
      <td>36</td>
      <td>hamming6-2</td>
      <td>64</td>
      <td>0.00</td>
      <td>32</td>
      <td>0.02</td>
      <td>32.0</td>
    </tr>
    <tr>
      <th>37</th>
      <td>37</td>
      <td>hamming6-4</td>
      <td>64</td>
      <td>0.00</td>
      <td>4</td>
      <td>0.00</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>38</th>
      <td>38</td>
      <td>hamming8-2</td>
      <td>256</td>
      <td>0.68</td>
      <td>96</td>
      <td>10.61</td>
      <td>111.0</td>
    </tr>
    <tr>
      <th>39</th>
      <td>39</td>
      <td>hamming8-4</td>
      <td>256</td>
      <td>0.29</td>
      <td>13</td>
      <td>1.68</td>
      <td>13.0</td>
    </tr>
    <tr>
      <th>40</th>
      <td>40</td>
      <td>johnson16-2-4</td>
      <td>120</td>
      <td>0.05</td>
      <td>8</td>
      <td>0.29</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>41</th>
      <td>41</td>
      <td>johnson32-2-4</td>
      <td>496</td>
      <td>11.38</td>
      <td>16</td>
      <td>122.29</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>42</th>
      <td>42</td>
      <td>johnson8-2-4</td>
      <td>28</td>
      <td>0.00</td>
      <td>4</td>
      <td>0.00</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>43</th>
      <td>43</td>
      <td>johnson8-4-4</td>
      <td>70</td>
      <td>0.00</td>
      <td>11</td>
      <td>0.02</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>44</th>
      <td>44</td>
      <td>keller4</td>
      <td>171</td>
      <td>0.05</td>
      <td>11</td>
      <td>0.46</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>45</th>
      <td>45</td>
      <td>keller5</td>
      <td>776</td>
      <td>29.24</td>
      <td>23</td>
      <td>255.78</td>
      <td>25.0</td>
    </tr>
    <tr>
      <th>46</th>
      <td>46</td>
      <td>keller6</td>
      <td>3361</td>
      <td>18566.02</td>
      <td>47</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>47</th>
      <td>47</td>
      <td>p_hat1000-1</td>
      <td>1000</td>
      <td>3.39</td>
      <td>9</td>
      <td>3.32</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>48</th>
      <td>48</td>
      <td>p_hat1000-2</td>
      <td>1000</td>
      <td>17.10</td>
      <td>34</td>
      <td>17.32</td>
      <td>34.0</td>
    </tr>
    <tr>
      <th>49</th>
      <td>49</td>
      <td>p_hat1000-3</td>
      <td>1000</td>
      <td>46.68</td>
      <td>46</td>
      <td>47.93</td>
      <td>46.0</td>
    </tr>
    <tr>
      <th>50</th>
      <td>50</td>
      <td>p_hat1500-1</td>
      <td>1500</td>
      <td>21.50</td>
      <td>11</td>
      <td>21.43</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>51</th>
      <td>51</td>
      <td>p_hat1500-2</td>
      <td>1500</td>
      <td>60.03</td>
      <td>45</td>
      <td>61.87</td>
      <td>45.0</td>
    </tr>
    <tr>
      <th>52</th>
      <td>52</td>
      <td>p_hat1500-3</td>
      <td>1500</td>
      <td>226.30</td>
      <td>63</td>
      <td>238.45</td>
      <td>63.0</td>
    </tr>
    <tr>
      <th>53</th>
      <td>53</td>
      <td>p_hat300-1</td>
      <td>300</td>
      <td>0.06</td>
      <td>7</td>
      <td>0.06</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>54</th>
      <td>54</td>
      <td>p_hat300-2</td>
      <td>300</td>
      <td>0.12</td>
      <td>21</td>
      <td>0.13</td>
      <td>21.0</td>
    </tr>
    <tr>
      <th>55</th>
      <td>55</td>
      <td>p_hat300-3</td>
      <td>300</td>
      <td>0.30</td>
      <td>27</td>
      <td>0.33</td>
      <td>27.0</td>
    </tr>
    <tr>
      <th>56</th>
      <td>56</td>
      <td>p_hat500-1</td>
      <td>500</td>
      <td>0.31</td>
      <td>8</td>
      <td>0.32</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>57</th>
      <td>57</td>
      <td>p_hat500-2</td>
      <td>500</td>
      <td>0.83</td>
      <td>28</td>
      <td>0.87</td>
      <td>28.0</td>
    </tr>
    <tr>
      <th>58</th>
      <td>58</td>
      <td>p_hat500-3</td>
      <td>500</td>
      <td>2.41</td>
      <td>36</td>
      <td>2.47</td>
      <td>36.0</td>
    </tr>
    <tr>
      <th>59</th>
      <td>59</td>
      <td>p_hat700-1</td>
      <td>700</td>
      <td>1.03</td>
      <td>8</td>
      <td>1.05</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>60</th>
      <td>60</td>
      <td>p_hat700-2</td>
      <td>700</td>
      <td>2.98</td>
      <td>35</td>
      <td>3.17</td>
      <td>35.0</td>
    </tr>
    <tr>
      <th>61</th>
      <td>61</td>
      <td>p_hat700-3</td>
      <td>700</td>
      <td>12.67</td>
      <td>44</td>
      <td>13.25</td>
      <td>44.0</td>
    </tr>
    <tr>
      <th>62</th>
      <td>62</td>
      <td>san1000</td>
      <td>1000</td>
      <td>38.31</td>
      <td>10</td>
      <td>40.49</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>63</th>
      <td>63</td>
      <td>san200_0.7_1</td>
      <td>200</td>
      <td>0.08</td>
      <td>17</td>
      <td>0.09</td>
      <td>17.0</td>
    </tr>
    <tr>
      <th>64</th>
      <td>64</td>
      <td>san200_0.7_2</td>
      <td>200</td>
      <td>0.10</td>
      <td>14</td>
      <td>0.11</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>65</th>
      <td>65</td>
      <td>san200_0.9_1</td>
      <td>200</td>
      <td>0.20</td>
      <td>47</td>
      <td>0.23</td>
      <td>47.0</td>
    </tr>
    <tr>
      <th>66</th>
      <td>66</td>
      <td>san200_0.9_2</td>
      <td>200</td>
      <td>0.19</td>
      <td>41</td>
      <td>0.21</td>
      <td>41.0</td>
    </tr>
    <tr>
      <th>67</th>
      <td>67</td>
      <td>san200_0.9_3</td>
      <td>200</td>
      <td>0.19</td>
      <td>31</td>
      <td>0.21</td>
      <td>31.0</td>
    </tr>
    <tr>
      <th>68</th>
      <td>68</td>
      <td>san400_0.5_1</td>
      <td>400</td>
      <td>1.36</td>
      <td>9</td>
      <td>1.49</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>69</th>
      <td>69</td>
      <td>san400_0.7_1</td>
      <td>400</td>
      <td>3.03</td>
      <td>22</td>
      <td>3.34</td>
      <td>22.0</td>
    </tr>
    <tr>
      <th>70</th>
      <td>70</td>
      <td>san400_0.7_2</td>
      <td>400</td>
      <td>2.32</td>
      <td>18</td>
      <td>2.56</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>71</th>
      <td>71</td>
      <td>san400_0.7_3</td>
      <td>400</td>
      <td>2.05</td>
      <td>16</td>
      <td>2.23</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>72</th>
      <td>72</td>
      <td>san400_0.9_1</td>
      <td>400</td>
      <td>1.79</td>
      <td>53</td>
      <td>1.97</td>
      <td>53.0</td>
    </tr>
    <tr>
      <th>73</th>
      <td>73</td>
      <td>sanr200_0.7</td>
      <td>200</td>
      <td>0.07</td>
      <td>15</td>
      <td>0.08</td>
      <td>15.0</td>
    </tr>
    <tr>
      <th>74</th>
      <td>74</td>
      <td>sanr200_0.9</td>
      <td>200</td>
      <td>0.19</td>
      <td>32</td>
      <td>0.21</td>
      <td>32.0</td>
    </tr>
    <tr>
      <th>75</th>
      <td>75</td>
      <td>sanr400_0.5</td>
      <td>400</td>
      <td>0.67</td>
      <td>11</td>
      <td>0.73</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>76</th>
      <td>76</td>
      <td>sanr400_0.7</td>
      <td>400</td>
      <td>1.74</td>
      <td>18</td>
      <td>1.93</td>
      <td>18.0</td>
    </tr>
  </tbody>
</table>
</div>




```python

```
