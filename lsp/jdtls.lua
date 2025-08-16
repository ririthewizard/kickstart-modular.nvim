return {
	cmd = { "jdtls", "-configuration", "/home/runner/.cache/jdtls/config", "-data", "/home/runner/.cache/jdtls/workspace" },
	filetypes = { "java" },
	root_markers = {
		".git",
		"build.gradle",
		"build.gradle.kts",
		"build.xml",
		"pom.xml",
		"settings.gradle",
		"settings.gradle.kts",
	},
	init_options = {
		jvm_args = {},
		workspace = "/home/runner/.cache/jdtls/workspace"
	}
}
