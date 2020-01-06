# Machine-Learning
Example Code for Machine Learning

lighter ones are:
{0: 'Solarize_Light2', 1: 'grayscale', 2: 'ggplot', 6: 'seaborn-ticks', 9: '_classic_test', 10: 'seaborn-darkgrid', 12: 'seaborn', 14: 'classic', 17: 'seaborn-dark', 18: 'fivethirtyeight', 23: 'seaborn-white', 24: 'seaborn-whitegrid'}

darker ones are:
{3: 'seaborn-dark-palette', 4: 'seaborn-poster', 5: 'tableau-colorblind10', 7: 'seaborn-muted', 8: 'seaborn-bright', 11: 'seaborn-paper', 13: 'seaborn-colorblind', 15: 'seaborn-talk', 16: 'seaborn-notebook', 19: 'fast', 20: 'bmh', 21: 'seaborn-pastel', 22: 'seaborn-deep', 25: 'dark_background'}

from jupyterthemes import get_themes
import jupyterthemes as jt
from jupyterthemes.stylefx import set_nb_theme
set_nb_theme('onedork')

plt.style.use(['fast']) 


