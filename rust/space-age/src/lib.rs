// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

#[derive(Debug)]
pub struct Duration {
  s: u64,
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration { s }
    }
}

pub trait Planet {
    fn years_during(d: &Duration) -> f64 {
        todo!("convert a duration ({d:?}) to the number of years on this planet for that duration");
    }
}

const EARTH_YEAR:f64 = 60f64 * 60f64 * 24f64 * 365.25;

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR / 0.2408467
  }
}
impl Planet for Venus {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR / 0.61519726
  }
}
impl Planet for Earth {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR
  }
}
impl Planet for Mars {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR / 1.8808158
  }
}
impl Planet for Jupiter {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR / 11.862615
  }
}
impl Planet for Saturn {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR / 29.447498
  }
}
impl Planet for Uranus {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR / 84.016846
  }
}
impl Planet for Neptune {
  fn years_during(d: &Duration) -> f64 {
    (d.s as f64) / EARTH_YEAR / 164.79132
  }
}
