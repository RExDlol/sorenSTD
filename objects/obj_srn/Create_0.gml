Input.create_key("right");
Input.bind_key("right", ord("D"));
Input.bind_key("right", vk_right);

Input.create_key("left");
Input.bind_key("left", ord("A"));
Input.bind_key("left", vk_left);

Input.create_key("up");
Input.bind_key("up", ord("W"));
Input.bind_key("up", vk_up);

Input.create_key("down");
Input.bind_key("down", ord("S"));
Input.bind_key("down", vk_down);

velh = 0;
velv = 0;

color_correction = new __Srn_Effect_Generic_Class(__shader_grayscale_e);

