local M = {}

local valid_modes = {
	[""] = true, -- Normal, Visual, Select, Operator-pending
	["n"] = true, -- Normal
	["v"] = true, -- Visual, Select
	["s"] = true, -- Select
	["x"] = true, -- Visual
	["o"] = true, -- Operator-pending
	["!"] = true, -- Insert, Command-line
	["i"] = true, -- Insert
	["l"] = true, -- Insert, Command-line, Lang-Arg
	["c"] = true, -- Command-line
	["t"] = true, -- Terminal
}

M.map = function(mode, keys, command, opt)
	if keys == nil or keys == "" then
		return
	end
	local options = { noremap = true, silent = true }
	if opt then
		options = vim.tbl_extend("force", options, opt)
	end
	local function map_wrapper(sub_mode, lhs, rhs, sub_options)
		if type(lhs) == "table" then
			for _, key in ipairs(lhs) do
				map_wrapper(sub_mode, key, rhs, sub_options)
			end
		else
			if type(sub_mode) == "table" then
				for _, m in ipairs(sub_mode) do
					map_wrapper(m, lhs, rhs, sub_options)
				end
			else
				if valid_modes[sub_mode] and lhs and rhs then
					vim.api.nvim_set_keymap(sub_mode, lhs, rhs, sub_options)
				else
					sub_mode, lhs, rhs = sub_mode or "", lhs or "", rhs or ""
					print(
						"Cannot set mapping [ mode = '"
							.. sub_mode
							.. "' | key = '"
							.. lhs
							.. "' | cmd = '"
							.. rhs
							.. "' ]"
					)
				end
			end
		end
	end
	map_wrapper(mode, keys, command, options)
end

M.mapBuf = function(buf, mode, keys, command, opt)
	if keys == nil or keys == "" then
		return
	end
	local options = { noremap = true, silent = true }
	if opt then
		options = vim.tbl_extend("force", options, opt)
	end
	local function map_wrapper(bufr, sub_mode, lhs, rhs, sub_options)
		if type(lhs) == "table" then
			for _, key in ipairs(lhs) do
				map_wrapper(sub_mode, key, rhs, sub_options)
			end
		else
			if type(sub_mode) == "table" then
				for _, m in ipairs(sub_mode) do
					map_wrapper(m, lhs, rhs, sub_options)
				end
			else
				if valid_modes[sub_mode] and lhs and rhs then
					vim.api.nvim_buf_set_keymap(bufr, sub_mode, lhs, rhs, sub_options)
				else
					sub_mode, lhs, rhs = sub_mode or "", lhs or "", rhs or ""
					print(
						"Cannot set mapping [ mode = '"
							.. sub_mode
							.. "' | key = '"
							.. lhs
							.. "' | cmd = '"
							.. rhs
							.. "' ]"
					)
				end
			end
		end
	end
	map_wrapper(buf, mode, keys, command, options)
end

return M
