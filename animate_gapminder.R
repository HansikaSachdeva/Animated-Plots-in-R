#Installing necessary packages
install.packages('gapminder', 'ggplot2', 'gganimate', 'gifski')
library(gapminder)

#Looking at the data
gapminder

#Using ggplot to create a static plot
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = country)) +   #data from gapminder, gdpPercap on x axis and lifeExp on y axis
    geom_point(alpha = 0.7, show.legend = FALSE) +  #translucency of points
    scale_color_manual(values = country_colors) +   #color based on countries
    scale_size(range = c(2, 12)) +  #range of size of points
    scale_x_log10() +   #logarithmically transforms the data in the X axis via log10
    facet_wrap(~continent) +    #sub plots based on continents
    labs(title = 'Year: 1952-2007', x = 'GDP per capita', y = 'Life expectancy')    #define title, x and y axis


#Gdp per capita vs Life expectancy
p1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
    geom_point(alpha = 0.7, show.legend = FALSE) +
    scale_colour_manual(values = country_colors) +
    scale_size(range = c(2, 12)) +
    scale_x_log10() +
    facet_wrap(~continent) +
    # Animating the plot
    labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life expectancy') +
    transition_time(year) +
    ease_aes('linear')

animate(p1)
anim_save('plot_gdpPercap_lifeExp.gif')

#Population vs Life expectancy
p2 <- ggplot(gapminder, aes(pop, lifeExp, size = pop, colour = country)) +
    geom_point(alpha = 0.7, show.legend = FALSE) +
    scale_colour_manual(values = country_colors) +
    scale_size(range = c(2, 12)) +
    scale_x_log10() +
    facet_wrap(~continent) +
    labs(title = 'Year: {frame_time}', x = 'Population', y = 'Life expectancy') +
    transition_time(year) +
    ease_aes('linear')

animate(p2)
anim_save('plot_pop_lifeExp.gif')

#Horizontal plot
p3 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
    geom_point(alpha = 0.7, show.legend = FALSE) +
    scale_colour_manual(values = country_colors) +
    scale_size(range = c(2, 12)) +
    scale_x_log10() +
    facet_wrap(~continent, ncol = 5) +
    labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life expectancy') +
    transition_time(year) +
    ease_aes('linear')

animate(p3)
anim_save('plot_horizontal_gdpPercap_lifeExp.gif')

#Vertical plot
p4 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
    geom_point(alpha = 0.7, show.legend = FALSE) +
    scale_colour_manual(values = country_colors) +
    scale_size(range = c(2, 12)) +
    scale_x_log10() +
    facet_wrap(~continent, ncol = 1) +
    labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life expectancy') +
    transition_time(year) +
    ease_aes('linear')

animate(p4)
anim_save('plot_vertical_gdpPercap_lifeExp.gif')

#Combined all continents
p5 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = continent)) +
    geom_point(alpha = 0.7) +
    scale_colour_manual(values = continent_colors)+
    scale_size(range = c(2, 12)) +
    scale_x_log10() +
    labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life expectancy') +
    transition_time(year) +
    ease_aes('linear')

animate(p5)
anim_save('plot_continents_together_gdpPercap_lifeExp.gif')

