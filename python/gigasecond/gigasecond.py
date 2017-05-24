import datetime

gsecond = 10**9  # seconds

def add_gigasecond(date):
    return date + datetime.timedelta(seconds=gsecond)