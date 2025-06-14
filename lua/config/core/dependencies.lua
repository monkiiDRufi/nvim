M = {}

local function print_dependency(name, installed, error)
	local emoji = installed and "✅" or "❌"
	print(string.format("%-15s %5s", name, emoji))
	if error ~= nil then
		print(error)
	end
end

function M._installLazy()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.uv.fs_stat(lazypath) then
		print("Installing Lazy...")
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			error("Error cloning lazy.nvim:\n" .. out)
		end
	end ---@diagnostic disable-next-line: undefined-field
	vim.opt.rtp:prepend(lazypath)
end

function M._validateTreesitter()
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
end

function M._validateTelescope()
	local COMPILERS = { "gcc", "clang", "make", "cmake" }
	local hasCompiler = false
	for _, compiler in ipairs(COMPILERS) do
		if vim.fn.executable(compiler) then
			hasCompiler = true
		end
	end

	if not hasCompiler then
		error("Not able to find a valid compiler: " .. vim.inspect(COMPILERS))
	end
	if not vim.fn.executable("fzf") then
		error("Fzf is not installed")
	end
end

function M.install()
	local dependencies = {
		Lazy = M._installLazy,
		Treesitter = M._validateTreesitter,
		Telescope = M._validateTelescope,
	}
	for dependency, installationFunction in pairs(dependencies) do
		local installed, error = pcall(installationFunction)
		print_dependency(dependency, installed, error)
	end
end

return M
