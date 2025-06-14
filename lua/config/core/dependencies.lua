M = {}

local function print_dependency(name)
	print(string.format("%-15s %5s", name, "✅"))
end

function M._installLazy()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.uv.fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			error("Error cloning lazy.nvim:\n" .. out)
		end
		print_dependency("Lazy installed")
	else
		print_dependency("Lazy")
	end ---@diagnostic disable-next-line: undefined-field
	vim.opt.rtp:prepend(lazypath)
end

function M._installTreeSitter()
	-- Test if this works, then assert path exists
	local msvsBinPath = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\Llvm\\x64\\bin"
	local clangPath = msvsBinPath .. "/clang.exe"
	if not vim.uv.fs_stat(clangPath) then
		error("Microsoft visual studio tools are not installed in location: " .. msvsBinPath)
	end

	local path = vim.fn.environ().PATH
	if string.find(path, msvsBinPath) == nil then
		error(msvsBinPath .. " is not in PATH")
	end

	print_dependency("Treesitter")
end

function M.install()
	M._installLazy()
	M._installTreeSitter()
end

return M
