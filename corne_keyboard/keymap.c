/*
Copyright 2019 @foostan
Copyright 2020 Drashna Jaelre <@drashna>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

enum custom_keycodes {
    CU_PIPE = SAFE_RANGE,
    CU_SCLN,
    CU_LTHN,
	CU_QUES,
	CU_PLUS,
	CU_BSLS,
	CU_QUOT,
	CU_LCBR,
	CU_RCBR,
	CU_TILDE,
	CU_MINS,
	CU_WTIL,
	CU_RQUES,
	CU_CIRC,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT_split_3x6_3(
	  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
	       KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                         KC_Y,    KC_U,    KC_I,    KC_O,   KC_P,  KC_BSPC,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
	      KC_LSFT,    KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                         KC_H,    KC_J,    KC_K,    KC_L, CU_SCLN, KC_RSFT,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
	      KC_LCTL,    KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                         KC_N,    KC_M, KC_COMM,  KC_DOT, CU_MINS,  KC_ESC,
	  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
							  		KC_LALT,   LT(1, KC_SPC), KC_LGUI,     LT(2, KC_ENT),   LT(1, KC_SPC), KC_RGUI
							  			//`--------------------------'  `--------------------------'
	),

	[1] = LAYOUT_split_3x6_3(
	  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
	       KC_TAB,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                         KC_6,    KC_7,    KC_8,    KC_9,    KC_0, KC_BSPC,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
	      KC_LSFT, CU_PIPE, CU_LTHN, CU_QUES, CU_PLUS, CU_BSLS,       				KC_CAPS,  CU_QUOT, CU_LCBR, CU_RCBR,CU_TILDE, KC_RSFT,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
	      KC_LCTL, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                		 XXXXXXX,CU_RQUES, CU_CIRC, XXXXXXX, CU_WTIL,  KC_ESC,
	  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
										      KC_LALT, KC_TRNS, KC_LGUI,    XXXXXXX, KC_TRNS, KC_RGUI
										  //`--------------------------'  `--------------------------'
	),

	[2] = LAYOUT_split_3x6_3(
	  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
	       KC_TAB, RGB_TOG, UG_HUEU, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_BSPC,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+----------|
	      KC_LCTL, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_LEFT, KC_DOWN,   KC_UP,KC_RIGHT, XXXXXXX, KC_RSFT,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+----------|
	      KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  KC_ESC,
	  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
												KC_LALT, XXXXXXX, MO(3),    KC_TRNS, _______, XXXXXXX
										  //`--------------------------'  `--------------------------'
	),

	[3] = LAYOUT_split_3x6_3(
	  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
	       KC_TAB, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      MS_WHLL, MS_WHLD, MS_WHLU, MS_WHLR, XXXXXXX, KC_BSPC,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+---------
	      KC_LCTL, XXXXXXX, XXXXXXX, XXXXXXX, MS_BTN2, MS_BTN1,                      MS_LEFT, MS_DOWN,   MS_UP, MS_RGHT, XXXXXXX, KC_RSFT,
	  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+---------
	      KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  KC_ESC,
	  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
										 	_______, _______, KC_TRNS,     KC_TRNS, _______, _______
										  //`--------------------------'  `--------------------------'
	)
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    if (record->event.pressed) {
        switch (keycode) {
            case CU_PIPE:
                tap_code16(0x0035);
                return false;
            case CU_SCLN:
                tap_code16(0x0033);
                return false;
			case CU_QUES:
				tap_code16(0x002e);
				return false;
			case CU_PLUS:
				tap_code16(0x0030);
				return false;
            case CU_LTHN:
				tap_code16(0x0064);
                return false;
			case CU_BSLS:
				register_code(KC_LALT);
                tap_code16(0x002d);
				unregister_code(KC_LALT);
				return false;
			case CU_QUOT:
                tap_code16(0x002d);
				return false;
            case CU_LCBR:
                tap_code16(0x0034);
                return false;
            case CU_RCBR:
                tap_code16(0x0031);
                return false;
            case CU_TILDE:
                tap_code16(0x002f);
                return false;
            case CU_MINS:
                tap_code16(0x0038);
                return false;
            case CU_WTIL:
				register_code(KC_LALT);
                tap_code16(0x0031);
				unregister_code(KC_LALT);
                return false;
            case CU_RQUES:
				register_code(KC_LSFT);
                tap_code16(0x002d);
				unregister_code(KC_LSFT);
                return false;
            case CU_CIRC:
				register_code(KC_LALT);
                tap_code16(0x0034);
				unregister_code(KC_LALT);
                return false;
        }
    }
    return true;
}

#ifdef ENCODER_MAP_ENABLE
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
  [0] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [1] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [2] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [3] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
};
#endif
