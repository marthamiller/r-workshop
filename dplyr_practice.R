data(flights)

st_patty <- dplyr::filter(flights, month == 3, day == 17)

chicago_destination <- dplyr::filter(flights, dest == "ORD")

chicago_destination_UA <- dplyr::filter(chicago_destination, carrier == "UA")

long_flights <- dplyr::filter(flights, distance > 2000 | air_time > (5*60))

 Flights_avg_speed<- dplyr::mutate(flights, avg_speed = distance/(air_time/60))
 speed <- dplyr::select(Flights_avg_speed, avg_speed, tailnum)
 

by_tailnum <- dplyr::group_by(speed, tailnum)
by_tailnum <- summarize(by_tailnum, count = n(), avg_speed = mean(avg_speed, na.rm = TRUE))
arrange(by_tailnum, desc(avg_speed))

speed %>%
  dplyr::group_by(tailnum) %>%
  dplyr::summarize(count = n(), avg_speed = mean(avg_speed, na.rm = TRUE)) %>%
  dplyr::arrange(desc(avg_speed))

flights %>%
  group_by(carrier) %>%
  summarize(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
  select(carrier, avg_delay) %>%
  arrange(avg_delay)




