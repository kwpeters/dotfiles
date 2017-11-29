module.exports = {
    "env": {
        "es6": true,
        "node": true
    },
    "extends": "eslint:recommended",
    "rules": {
        "indent": [
            "error",
            4,
	    {
		"SwitchCase": 1
	    }
        ],
        "linebreak-style": [
            "error",
            "unix"
        ],
        "quotes": [
            "off",
            "double",
            {
                "avoidEscape": true,
                "allowTemplateLiterals": true
            }
        ],
        "semi": [
            "error",
            "always"
        ],
        "max-len": [
            "error",
            120
        ],
        "one-var": [
            "error",
            "never"
        ],
        "require-jsdoc": [
            "off"
        ],
        "no-var": [
            "error"
        ],
        "no-multiple-empty-lines": [
            "error",
            {
                "max": 5,
                "maxEOF": 1,
                "maxBOF": 1
            }
        ],
        "space-before-function-paren": [
            "error",
            {
                "anonymous": "always",
                "named": "never"
            }
        ],
        "spaced-comment": [
            "error",
            "always",
            {
                "line": {
                    "markers": ["/"],
                    "exceptions": ["/"]
                },
                "block": {
                    "markers": ["*"]
                }
            }
        ],
        "padded-blocks": ["off"],
        "brace-style": ['error', '1tbs', {
            allowSingleLine: true
        }],
        "no-else-return": ["off"],
        "object-curly-spacing": ["off"],
        "arrow-parens": ["error", "always"],
        "no-new-wrappers": ["error"],
        //"no-multi-spaces": ["off"],
        "key-spacing": [
            "error",
            {
                "singleLine": {
                    "beforeColon": false,
                    "afterColon": true
                },
                "multiLine": {
                    "beforeColon": false,
                    "afterColon": true,
                    "align": "value"
                }
            }
        ],
        "no-console": ["off"]
    },
    globals: {
        "describe": true,
        "it": true,
        "jasmine": true,
        "beforeEach": true,
        "spyOn": true,
        "expect": true,
        "runs": true,
        "waitsFor": true,
        "afterEach": true
    }

};
