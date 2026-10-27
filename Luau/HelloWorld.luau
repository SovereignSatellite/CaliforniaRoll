--!native
--!optimize 2

const instantiate = os.clock()

const Compiler = require("./Compiler")
const VM = require("./VM")

print((string.format("(Instantiate) %.6f s", os.clock() - instantiate)))

const SOURCE = [[
print(" **** **** ")
print("***********")
print("***********")
print("  *******  ")
print("    ***    ")
]]

for index = 1, 3 do
	print()

	const compile = os.clock()
	const bytecode = Compiler.compile(SOURCE)
	const closure = VM.load(bytecode)

	print((string.format("(Compile %d) %.6f s", index, os.clock() - compile)))

	const execute = os.clock()

	closure()

	print((string.format("(Execute %d) %.6f s", index, os.clock() - execute)))
end
