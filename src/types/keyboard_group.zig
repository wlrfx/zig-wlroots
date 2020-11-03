const wlr = @import("../wlroots.zig");

const wl = @import("wayland").server.wl;

pub const KeyboardGroup = extern struct {
    keyboard: wlr.Keyboard,
    input_device: *wlr.InputDevice,

    devices: wl.List,
    keys: wl.List,

    events: extern struct {
        /// wl.Array of u32 keycodes
        enter: wl.Signal(*wl.Array),
        /// wl.Array of u32 keycodes
        leave: wl.Signal(*wl.Array),
    },

    data: ?*c_void,

    extern fn wlr_keyboard_group_create() ?*KeyboardGroup;
    pub const create = wlr_keyboard_group_create;

    extern fn wlr_keyboard_group_from_wlr_keyboard(keyboard: *wlr.Keyboard) ?*KeyboardGroup;
    pub const fromKeyboard = wlr_keyboard_group_from_wlr_keyboard;

    extern fn wlr_keyboard_group_add_keyboard(group: *KeyboardGroup, keyboard: *wlr.Keyboard) bool;
    pub const addKeyboard = wlr_keyboard_group_add_keyboard;

    extern fn wlr_keyboard_group_remove_keyboard(group: *KeyboardGroup, keyboard: *wlr.Keyboard) void;
    pub const removeKeyboard = wlr_keyboard_group_remove_keyboard;

    extern fn wlr_keyboard_group_destroy(group: *KeyboardGroup) void;
    pub const destroy = wlr_keyboard_group_destroy;
};