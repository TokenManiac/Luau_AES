local AES = require './AES'
local key = 0x68C756C6C186436
local plaintext = 'my secret, with extra length so that it is waaaaaaaaay over 16 bytes.'
local cyphertext = AES.ECB_256(AES.encrypt, key, plaintext)
local newtext = AES.ECB_256(AES.decrypt, key, cyphertext)
print(plaintext)
print(#cyphertext, cyphertext)
print(#newtext, newtext)
