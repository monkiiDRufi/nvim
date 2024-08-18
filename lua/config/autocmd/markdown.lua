local function split(text, del)
	if del == nil then
		del = "%s"
	end
	local t = {}
	for str in string.gmatch(text, "([^" .. del .. "]+)") do
		table.insert(t, str)
	end
	return t
end

local function name(filename)
	return split(filename, ".")[1]
end

local function extension(filename)
	return split(filename, ".")[2]
end

local function compileToHtml()
	local directoryFullPath = vim.fn.expand("%:p:h") .. "\\"
	local markdownFile = vim.fn.expand("%:t")
	if extension(markdownFile) ~= "md" then
		return ':error("Current file is not a markdown file!")'
	end
	local inputFile = directoryFullPath .. markdownFile
	local outputFile = directoryFullPath .. name(markdownFile) .. ".html"
	return string.format(":!pandoc -s -f markdown -t html5 %s -o %s -c styles.css <CR>", inputFile, outputFile)
end

local function compileToPdf()
	local directoryFullPath = vim.fn.expand("%:p:h") .. "\\"
	local markdownFile = vim.fn.expand("%:t")
	if extension(markdownFile) ~= "md" then
		return ':error("Current file is not a markdown file!")'
	end
	local inputFile = directoryFullPath .. markdownFile
	local outputFile = directoryFullPath .. name(markdownFile) .. ".pdf"
	return string.format(
		":!pandoc %s -o %s -V colorlinks=true <CR>", --, -V linkcolor=blue -V urlcolor=red -V toccolor=gray <CR>",
		inputFile,
		outputFile
	)
end

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Define markdown snippets on enter .md files",
	pattern = "*.md",
	group = vim.api.nvim_create_augroup("markdown_snippets", { clear = true }),
	callback = function()
		vim.keymap.set("n", "<leader>o", ':!chrome "%:p"<CR>', { desc = "[O]pen in [W]ebrowser" })

		vim.keymap.set("n", "<leader>ch", compileToHtml(), { desc = "[C]ompile to [H]tml" })
		vim.keymap.set("n", "<leader>cp", compileToPdf(), { desc = "[C]ompile to [P]df" })

		print("Loaded markdown snippets")
	end,
})

-- vim: ts=2 sts=2 sw=2 et
