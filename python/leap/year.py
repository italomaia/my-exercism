def is_leap_year(year):
    """
    Tells if the given year is a leap year.

    on every year that is evenly divisibleby 4
      except every year that is evenly divisible by 100
        unless the year is also evenly divisible by 400
    """
    if year % 4 == 0:
        return year % 400 == 0 or not year % 100 == 0
    return False