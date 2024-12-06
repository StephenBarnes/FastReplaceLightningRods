data.raw["lightning-attractor"]["lightning-rod"].next_upgrade = "lightning-collector"
data.raw["lightning-attractor"]["lightning-rod"].fast_replaceable_group = "lightning-rod"
data.raw["lightning-attractor"]["lightning-collector"].fast_replaceable_group = "lightning-rod"

-- Lightning rods and collectors must have the same size collision box to be replaceable.
data.raw["lightning-attractor"]["lightning-collector"].collision_box = data.raw["lightning-attractor"]["lightning-rod"].collision_box
data.raw["lightning-attractor"]["lightning-collector"].selection_box = data.raw["lightning-attractor"]["lightning-rod"].selection_box
data.raw["lightning-attractor"]["lightning-collector"].tile_width = 1
data.raw["lightning-attractor"]["lightning-collector"].tile_height = 1

-- Scale sprites so they look like they fit in the new size collision box.
local function adjustLayers(pic, scale, shift, shiftShadow)
	for _, layer in pairs(pic.layers) do
		layer.scale = layer.scale * scale
		if layer.draw_as_shadow then
			layer.shift[1] = layer.shift[1] + shiftShadow[1]
			layer.shift[2] = layer.shift[2] + shiftShadow[2]
		else
			layer.shift[1] = layer.shift[1] + shift[1]
			layer.shift[2] = layer.shift[2] + shift[2]
		end
	end
end
local function adjustChargableGraphics(chargableGraphics, scale, shift, shiftShadow)
	for _, key in pairs({"picture", "charge_animation", "discharge_animation"}) do
		adjustLayers(chargableGraphics[key], scale, shift, shiftShadow)
	end
end
adjustChargableGraphics(data.raw["lightning-attractor"]["lightning-collector"].chargable_graphics, .65, {0, 0.6}, {0, -0.1})
--adjustChargableGraphics(data.raw["lightning-attractor"]["lightning-rod"].chargable_graphics, 1.2, ..)