import unittest

from qmcpy.integrand import Keister


class Test_KeisterFun(unittest.TestCase):
    def test_KeisterFun_Construction_2D(self):
        kf = Keister()
        with self.subTest():
            self.assertEqual(len(kf), 1)
        with self.subTest():
            self.assertEqual(kf[0].dimension, 2)  # default value


if __name__ == "__main__":
    unittest.main()
