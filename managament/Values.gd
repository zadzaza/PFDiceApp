extends Node
# ---------٩(◕‿◕｡)۶-----------
var autobet_active: bool = false

var min_value = 10000
var max_value = 3000000
var range1_value: int = 0
var range2_value: int = 1
var bet_value: int = 10000
var sum: int = 100000
var sum_autobet: int = sum
var chance_value: int = 0
var coeff_value: float = 0
var throw_count: int = 0
# ---------＼(≧▽≦)／----------
var if_win_not_change: bool = true
var if_win_return_base_bet: bool = false
var if_win_increase: bool = false
var if_win_decrease: bool = false

var if_win_value_increase: float
var if_win_value_decrease: float
# ---------(￢_￢)------------
var if_def_not_change: bool = true
var if_def_return_base_bet: bool = false
var if_def_increase: bool = false
var if_def_decrease: bool = false

var if_def_value_increase: float
var if_def_value_decrease: float
# ---------(•⩊•)------------
var stop_if_is_over: bool = false
var stop_if_is_less: bool = false

var stop_if_is_over_value: float
var stop_if_is_less_value: float
