# DataViz-Ideas
Data visualization ideas and templates for poster presentations and manuscripts. <br>
Typically minimalist style for the panels/grids but maximalist colors for data. 

<h2>Installation</h2>

R Studio using [ggplot2](https://github.com/tidyverse/ggplot2) and [Wes Anderson Palettes](https://github.com/karthik/wesanderson).

<h2>Visualizing age trajectories - <a href="https://github.com/pearlynne/DataViz-Ideas/blob/main/MinimalistPlots.R">MinimalistPlots.R</a> </h2>

| <b>Multilevel model of  data with Level-2 grouping </b> | <b> Individual trajectories over time </b> |
| ------------- | ------------- |
| <ul><li>Regulated vs Dysregulated group in trajectories (linear smooth)</li>| <li>Each point represents a single visit/data collection point.</li><li>Volor represents a single subject's growth over time  </ul></li>|
|<img src="https://user-images.githubusercontent.com/41930579/132595070-b75f32c9-4807-44ed-bd74-7006093783ea.png" alt="Group Differences" width="600"/> | <img src="https://user-images.githubusercontent.com/41930579/132595073-1d20efaf-62a8-480c-9ede-99a4c33b3387.png " alt="Individual Trajectories" width="600"/> |

<h2>Visualizing effect sizes in studies - <a href="https://github.com/pearlynne/DataViz-Ideas/blob/main/MetaEffectPlots.R">MetaEffect Plots.R</a> </h2>
<b>Example plot with randomized data showing (1) effect sizes of studies (2) examining change in a factor (3) across psychopathologies.</b> 
 <ul><li> Increase, no differences, or decrease in a neurotransmiter across different subtypes of disorder. </li>
  <li> Colors depict population age. </li>
  <li>Size of circles/points represent sample size.</ul></li> 
 <img src="https://user-images.githubusercontent.com/41930579/132768538-40866aef-6a2e-448c-8d6b-4bb9e7c1fc25.jpeg" alt="Effect sizes of studies examining change in a neurotransmitter across populations with neurodegenerative, psychopathology, and typical" width="700"/> 

<b>Same plot as above but free scales to accommodate uneven distribution of sub categories </b> <img src="https://user-images.githubusercontent.com/41930579/132768549-1744093a-bbd1-4323-929b-78cbd8efee91.jpeg" alt="Effect sizes of studies examining change in a neurotransmitter across populations with neurodegenerative, psychopathology, and typical" width="700"/>

