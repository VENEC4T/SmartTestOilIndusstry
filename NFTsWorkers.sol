# Palkeoramix decompiler. 

def storage:
  stor0 is array of struct at storage 0
  stor1 is array of struct at storage 1
  balanceOf is mapping of uint256 at storage 2
  ownerOf is mapping of addr at storage 3
  approved is mapping of addr at storage 4
  stor5 is mapping of uint8 at storage 5
  totalSupply is uint256 at storage 6
  cost is uint256 at storage 7
  unknownb6b6f0c3 is uint256 at storage 8
  owner is addr at storage 9
  stor10 is addr at storage 10
  unknown2fe8a993 is uint256 at storage 11
  unknowne7b99ec7 is uint256 at storage 12
  stor13 is uint256 at storage 13
  whitelistActive is uint8 at storage 14
  stor15 is mapping of uint256 at storage 15

def whitelistActive(): # not payable
  return bool(whitelistActive)

def getApproved(uint256 _tokenId): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  return approved[_tokenId]

def cost(): # not payable
  return cost

def totalSupply(): # not payable
  return totalSupply

def unknown2fe8a993(): # not payable
  return unknown2fe8a993

def ownerOf(uint256 _tokenId): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  return ownerOf[_tokenId]

def balanceOf(address _owner): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  require _owner == _owner
  return balanceOf[_owner]

def owner(): # not payable
  return owner

def unknownb6b6f0c3(): # not payable
  return unknownb6b6f0c3

def unknowne7b99ec7(): # not payable
  return unknowne7b99ec7

def isApprovedForAll(address _owner, address _operator): # not payable
  require calldata.size - 4 >=ΓÇ▓ 64
  require _owner == _owner
  require _operator == _operator
  return bool(stor5[_owner][_operator])

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def removeWhitelist(): # not payable
  if owner != caller:
      revert with 818771057
  if not whitelistActive:
      revert with 556559901
  whitelistActive = 0

def unknown440bc7f3(uint256 _param1): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  if owner != caller:
      revert with 818771057
  stor13 = _param1

def setCost(uint256 _buildingCostWei): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  if owner != caller:
      revert with 818771057
  cost = _buildingCostWei

def unknown19ccaf05(uint256 _param1): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  if owner != caller:
      revert with 818771057
  unknown2fe8a993 = _param1

def unknown79c9cb7b(uint256 _param1): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  if owner != caller:
      revert with 818771057
  unknownb6b6f0c3 = _param1

def unknownd1d19213(uint256 _param1): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  if owner != caller:
      revert with 818771057
  unknowne7b99ec7 = _param1

def withdraw(): # not payable
  if owner != caller:
      revert with 818771057
  call owner with:
     value eth.balance(this.address) wei
       gas gas_remaining wei
  require ext_call.success

def setApprovalForAll(address _to, bool _approved): # not payable
  require calldata.size - 4 >=ΓÇ▓ 64
  require _to == _to
  require _approved == _approved
  stor5[caller][addr(_to)] = uint8(_approved)
  log ApprovalForAll(
        address owner=_approved,
        address operator=caller,
        bool approved=_to)

def supportsInterface(bytes4 _interfaceId): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  require _interfaceId == Mask(32, 224, _interfaceId)
  if Mask(32, 224, _interfaceId) == 0x1ffc9a700000000000000000000000000000000000000000000000000000000:
      return True
  if Mask(32, 224, _interfaceId) == 0x80ac58cd00000000000000000000000000000000000000000000000000000000:
      return True
  return (Mask(32, 224, _interfaceId) == 0x5b5e139f00000000000000000000000000000000000000000000000000000000)

def approve(address _spender, uint256 _value): # not payable
  require calldata.size - 4 >=ΓÇ▓ 64
  require _spender == _spender
  if ownerOf[_value] != caller:
      if not stor5[stor3[_value]][caller]:
          revert with 0, 'NOT_AUTHORIZED'
  approved[_value] = _spender
  log Approval(
        address tokenOwner=ownerOf[_value],
        address spender=_spender,
        uint256 tokens=_value)

def transferFrom(address _from, address _to, uint256 _value): # not payable
  require calldata.size - 4 >=ΓÇ▓ 96
  require _from == _from
  require _to == _to
  if ownerOf[_value] != _from:
      revert with 0, 'WRONG_FROM'
  if not _to:
      revert with 0, 'INVALID_RECIPIENT'
  if _from != caller:
      if approved[_value] != caller:
          if not stor5[addr(_from)][caller]:
              revert with 0, 'NOT_AUTHORIZED'
  balanceOf[addr(_from)]--
  balanceOf[_to]++
  ownerOf[_value] = _to
  approved[_value] = 0
  log 0xfeddf252: _from, _to, _value

def safeTransferFrom(address _from, address _to, uint256 _tokenId): # not payable
  require calldata.size - 4 >=ΓÇ▓ 96
  require _from == _from
  require _to == _to
  if ownerOf[_tokenId] != _from:
      revert with 0, 'WRONG_FROM'
  if not _to:
      revert with 0, 'INVALID_RECIPIENT'
  if _from != caller:
      if approved[_tokenId] != caller:
          if not stor5[addr(_from)][caller]:
              revert with 0, 'NOT_AUTHORIZED'
  balanceOf[addr(_from)]--
  balanceOf[_to]++
  ownerOf[_tokenId] = _to
  approved[_tokenId] = 0
  log 0xfeddf252: _from, _to, _tokenId
  if ext_code.size(_to):
      call _to.onERC721Received(address operator, address from, uint256 childTokenId, bytes data) with:
           gas gas_remaining wei
          args 0, uint32(caller), addr(_from), _tokenId, 128, 0
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >=ΓÇ▓ 32
      require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0x150b7a0200000000000000000000000000000000000000000000000000000000:
          revert with 0, 'UNSAFE_RECIPIENT'

def safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes _data): # not payable
  require calldata.size - 4 >=ΓÇ▓ 128
  require _from == _from
  require _to == _to
  require _data <= 18446744073709551615
  require _data + 35 <ΓÇ▓ calldata.size
  if _data.length > 18446744073709551615:
      revert with 0, 65
  if ceil32(ceil32(_data.length)) + 97 < 96 or ceil32(ceil32(_data.length)) + 97 > 18446744073709551615:
      revert with 0, 65
  require _data + _data.length + 36 <= calldata.size
  if ownerOf[_tokenId] != _from:
      revert with 0, 'WRONG_FROM'
  if not _to:
      revert with 0, 'INVALID_RECIPIENT'
  if _from != caller:
      if approved[_tokenId] != caller:
          if not stor5[addr(_from)][caller]:
              revert with 0, 'NOT_AUTHORIZED'
  balanceOf[addr(_from)]--
  balanceOf[_to]++
  ownerOf[_tokenId] = _to
  approved[_tokenId] = 0
  log 0xfeddf252: _from, _to, _tokenId
  if ext_code.size(_to):
      call _to.onERC721Received(address operator, address from, uint256 childTokenId, bytes data) with:
           gas gas_remaining wei
          args caller, addr(_from), _tokenId, Array(len=_data.length, data=_data[all])
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >=ΓÇ▓ 32
      require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0x150b7a0200000000000000000000000000000000000000000000000000000000:
          revert with 0, 'UNSAFE_RECIPIENT'

def tokenURI(uint256 _tokenId): # not payable
  require calldata.size - 4 >=ΓÇ▓ 32
  if not -_tokenId:
      return 32, 73, 'ipfs://bafybeicuplwjl4qmsnetgk7e', 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n', 0, 0, 199354445678, 0 >> 328, 0
  s = 0
  idx = _tokenId
  while idx:
      if not s + 1:
          revert with 0, 17
      s = s + 1
      idx = idx / 10
      continue 
  if s > 18446744073709551615:
      revert with 0, 65
  mem[96] = s
  mem[64] = ceil32(s) + 128
  if not s:
      t = s
      idx = _tokenId
      while idx:
          if t < 1:
              revert with 0, 17
          if 48 > !(idx % 10):
              revert with 0, 17
          if t - 1 >= mem[96]:
              revert with 0, 50
          mem[t + 127 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
          t = t - 1
          idx = idx / 10
          continue 
      _81 = mem[64]
      mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
      mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
      mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
      _83 = mem[96]
      mem[mem[64] + 99 len ceil32(mem[96])] = mem[128 len ceil32(mem[96])]
      mem[mem[96] + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
      if ceil32(mem[96]) <= mem[96]:
          _119 = mem[64]
          mem[64] = mem[96] + mem[64] + 104
          mem[mem[96] + _81 + 104] = 32
          _127 = mem[_119]
          mem[_83 + _81 + 136] = mem[_119]
          mem[_83 + _81 + 168 len ceil32(_127)] = mem[_119 + 32 len ceil32(_127)]
          if ceil32(_127) > _127:
              mem[_127 + _83 + _81 + 168] = 0
          return memory
            from mem[64]
             len ceil32(_127) + _83 + _81 + -mem[64] + 168
      _120 = mem[64]
      mem[64] = mem[96] + mem[64] + 104
      mem[mem[96] + _81 + 104] = 32
      _128 = mem[_120]
      mem[_83 + _81 + 136] = mem[_120]
      mem[_83 + _81 + 168 len ceil32(_128)] = mem[_120 + 32 len ceil32(_128)]
      if ceil32(_128) > _128:
          mem[_128 + _83 + _81 + 168] = 0
      return memory
        from mem[64]
         len ceil32(_128) + _83 + _81 + -mem[64] + 168
  mem[128 len s] = call.data[calldata.size len s]
  t = s
  idx = _tokenId
  while idx:
      if t < 1:
          revert with 0, 17
      if 48 > !(idx % 10):
          revert with 0, 17
      if t - 1 >= mem[96]:
          revert with 0, 50
      mem[t + 127 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
      t = t - 1
      idx = idx / 10
      continue 
  _82 = mem[64]
  mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
  mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
  mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
  _84 = mem[96]
  mem[mem[64] + 99 len ceil32(mem[96])] = mem[128 len ceil32(mem[96])]
  mem[mem[96] + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
  if ceil32(mem[96]) <= mem[96]:
      _121 = mem[64]
      mem[64] = mem[96] + mem[64] + 104
      mem[mem[96] + _82 + 104] = 32
      _129 = mem[_121]
      mem[_84 + _82 + 136] = mem[_121]
      mem[_84 + _82 + 168 len ceil32(_129)] = mem[_121 + 32 len ceil32(_129)]
      if ceil32(_129) > _129:
          mem[_129 + _84 + _82 + 168] = 0
      return memory
        from mem[64]
         len ceil32(_129) + _84 + _82 + -mem[64] + 168
  _122 = mem[64]
  mem[64] = mem[96] + mem[64] + 104
  mem[mem[96] + _82 + 104] = 32
  _130 = mem[_122]
  mem[_84 + _82 + 136] = mem[_122]
  mem[_84 + _82 + 168 len ceil32(_130)] = mem[_122 + 32 len ceil32(_130)]
  if ceil32(_130) > _130:
      mem[_130 + _84 + _82 + 168] = 0
  return memory
    from mem[64]
     len ceil32(_130) + _84 + _82 + -mem[64] + 168

def name(): # not payable
  if bool(stor0.length):
      if not bool(stor0.length) - (uint255(stor0.length) * 0.5 < 32):
          revert with 0, 34
      if bool(stor0.length):
          if not bool(stor0.length) - (uint255(stor0.length) * 0.5 < 32):
              revert with 0, 34
          if Mask(256, -1, stor0.length):
              if 31 < uint255(stor0.length) * 0.5:
                  mem[128] = uint256(stor0.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor0.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor0[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor0.length), data=mem[128 len ceil32(uint255(stor0.length) * 0.5)])
              mem[128] = 256 * stor0.length.field_8
      else:
          if not bool(stor0.length) - (stor0.length.field_1 < 32):
              revert with 0, 34
          if stor0.length.field_1:
              if 31 < stor0.length.field_1:
                  mem[128] = uint256(stor0.field_0)
                  idx = 128
                  s = 0
                  while stor0.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor0[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor0.length), data=mem[128 len ceil32(uint255(stor0.length) * 0.5)])
              mem[128] = 256 * stor0.length.field_8
      mem[ceil32(uint255(stor0.length) * 0.5) + 192 len ceil32(uint255(stor0.length) * 0.5)] = mem[128 len ceil32(uint255(stor0.length) * 0.5)]
      if ceil32(uint255(stor0.length) * 0.5) > uint255(stor0.length) * 0.5:
          mem[(uint255(stor0.length) * 0.5) + ceil32(uint255(stor0.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor0.length), data=mem[128 len ceil32(uint255(stor0.length) * 0.5)], mem[(2 * ceil32(uint255(stor0.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor0.length) * 0.5)]), 
  if not bool(stor0.length) - (stor0.length.field_1 < 32):
      revert with 0, 34
  if bool(stor0.length):
      if not bool(stor0.length) - (uint255(stor0.length) * 0.5 < 32):
          revert with 0, 34
      if Mask(256, -1, stor0.length):
          if 31 < uint255(stor0.length) * 0.5:
              mem[128] = uint256(stor0.field_0)
              idx = 128
              s = 0
              while (uint255(stor0.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor0[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor0.length % 128, data=mem[128 len ceil32(stor0.length.field_1)])
          mem[128] = 256 * stor0.length.field_8
  else:
      if not bool(stor0.length) - (stor0.length.field_1 < 32):
          revert with 0, 34
      if stor0.length.field_1:
          if 31 < stor0.length.field_1:
              mem[128] = uint256(stor0.field_0)
              idx = 128
              s = 0
              while stor0.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor0[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor0.length % 128, data=mem[128 len ceil32(stor0.length.field_1)])
          mem[128] = 256 * stor0.length.field_8
  mem[ceil32(stor0.length.field_1) + 192 len ceil32(stor0.length.field_1)] = mem[128 len ceil32(stor0.length.field_1)]
  if ceil32(stor0.length.field_1) > stor0.length.field_1:
      mem[stor0.length.field_1 + ceil32(stor0.length.field_1) + 192] = 0
  return Array(len=stor0.length % 128, data=mem[128 len ceil32(stor0.length.field_1)], mem[(2 * ceil32(stor0.length.field_1)) + 192 len 2 * ceil32(stor0.length.field_1)]), 

def symbol(): # not payable
  if bool(stor1.length):
      if not bool(stor1.length) - (uint255(stor1.length) * 0.5 < 32):
          revert with 0, 34
      if bool(stor1.length):
          if not bool(stor1.length) - (uint255(stor1.length) * 0.5 < 32):
              revert with 0, 34
          if Mask(256, -1, stor1.length):
              if 31 < uint255(stor1.length) * 0.5:
                  mem[128] = uint256(stor1.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor1.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor1[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor1.length), data=mem[128 len ceil32(uint255(stor1.length) * 0.5)])
              mem[128] = 256 * stor1.length.field_8
      else:
          if not bool(stor1.length) - (stor1.length.field_1 < 32):
              revert with 0, 34
          if stor1.length.field_1:
              if 31 < stor1.length.field_1:
                  mem[128] = uint256(stor1.field_0)
                  idx = 128
                  s = 0
                  while stor1.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor1[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor1.length), data=mem[128 len ceil32(uint255(stor1.length) * 0.5)])
              mem[128] = 256 * stor1.length.field_8
      mem[ceil32(uint255(stor1.length) * 0.5) + 192 len ceil32(uint255(stor1.length) * 0.5)] = mem[128 len ceil32(uint255(stor1.length) * 0.5)]
      if ceil32(uint255(stor1.length) * 0.5) > uint255(stor1.length) * 0.5:
          mem[(uint255(stor1.length) * 0.5) + ceil32(uint255(stor1.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor1.length), data=mem[128 len ceil32(uint255(stor1.length) * 0.5)], mem[(2 * ceil32(uint255(stor1.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor1.length) * 0.5)]), 
  if not bool(stor1.length) - (stor1.length.field_1 < 32):
      revert with 0, 34
  if bool(stor1.length):
      if not bool(stor1.length) - (uint255(stor1.length) * 0.5 < 32):
          revert with 0, 34
      if Mask(256, -1, stor1.length):
          if 31 < uint255(stor1.length) * 0.5:
              mem[128] = uint256(stor1.field_0)
              idx = 128
              s = 0
              while (uint255(stor1.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor1[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor1.length % 128, data=mem[128 len ceil32(stor1.length.field_1)])
          mem[128] = 256 * stor1.length.field_8
  else:
      if not bool(stor1.length) - (stor1.length.field_1 < 32):
          revert with 0, 34
      if stor1.length.field_1:
          if 31 < stor1.length.field_1:
              mem[128] = uint256(stor1.field_0)
              idx = 128
              s = 0
              while stor1.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor1[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor1.length % 128, data=mem[128 len ceil32(stor1.length.field_1)])
          mem[128] = 256 * stor1.length.field_8
  mem[ceil32(stor1.length.field_1) + 192 len ceil32(stor1.length.field_1)] = mem[128 len ceil32(stor1.length.field_1)]
  if ceil32(stor1.length.field_1) > stor1.length.field_1:
      mem[stor1.length.field_1 + ceil32(stor1.length.field_1) + 192] = 0
  return Array(len=stor1.length % 128, data=mem[128 len ceil32(stor1.length.field_1)], mem[(2 * ceil32(stor1.length.field_1)) + 192 len 2 * ceil32(stor1.length.field_1)]), 

def mint() payable: 
  if whitelistActive:
      revert with 768321274
  if stor15[caller] >= unknownb6b6f0c3:
      revert with 3968756323
  if 1 > !totalSupply:
      revert with 0, 17
  if totalSupply + 1 > 10000:
      revert with 1390387173
  if call.value < cost:
      revert with InsufficientFunds()
  if not stor15[caller] + 1:
      revert with 0, 17
  stor15[caller]++
  if not totalSupply + 1:
      revert with 0, 17
  totalSupply++
  if not caller:
      revert with 0, 'INVALID_RECIPIENT'
  if ownerOf[stor6]:
      revert with 0, 'ALREADY_MINTED'
  balanceOf[caller]++
  mem[32] = 3
  ownerOf[stor6] = caller
  log 0xfeddf252: 0, caller, totalSupply
  if not ext_code.size(caller):
      call stor10 with:
         value call.value / 40 wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      if call.value < call.value / 40:
          revert with 0, 17
      call owner with:
         value call.value - (call.value / 40) wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[0] = totalSupply
      if not -totalSupply:
          log 0xefe678c8: 32, 73, 'ipfs://bafybeicuplwjl4qmsnetgk7e', 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n', 0, 0, 199354445678, 0 >> 328, 0, caller, block.timestamp
      else:
          s = 0
          idx = totalSupply
          while idx:
              if not s + 1:
                  revert with 0, 17
              s = s + 1
              idx = idx / 10
              continue 
          if s > 18446744073709551615:
              revert with 0, 65
          mem[96] = s
          mem[64] = ceil32(s) + 128
          if not s:
              t = s
              idx = totalSupply
              while idx:
                  if t < 1:
                      revert with 0, 17
                  if 48 > !(idx % 10):
                      revert with 0, 17
                  if t - 1 >= mem[96]:
                      revert with 0, 50
                  mem[t + 127 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
                  t = t - 1
                  idx = idx / 10
                  continue 
              _195 = mem[64]
              mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
              mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
              mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
              _199 = mem[96]
              mem[mem[64] + 99 len ceil32(mem[96])] = mem[128 len ceil32(mem[96])]
              mem[mem[96] + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
              if ceil32(mem[96]) <= mem[96]:
                  _271 = mem[64]
                  mem[64] = mem[96] + mem[64] + 104
                  mem[mem[96] + _195 + 104] = 32
                  _287 = mem[_271]
                  mem[_199 + _195 + 136] = mem[_271]
                  mem[_199 + _195 + 168 len ceil32(_287)] = mem[_271 + 32 len ceil32(_287)]
                  if ceil32(_287) > _287:
                      mem[_287 + _199 + _195 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
              else:
                  _272 = mem[64]
                  mem[64] = mem[96] + mem[64] + 104
                  mem[mem[96] + _195 + 104] = 32
                  _288 = mem[_272]
                  mem[_199 + _195 + 136] = mem[_272]
                  mem[_199 + _195 + 168 len ceil32(_288)] = mem[_272 + 32 len ceil32(_288)]
                  if ceil32(_288) > _288:
                      mem[_288 + _199 + _195 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
          else:
              mem[128 len s] = call.data[calldata.size len s]
              t = s
              idx = totalSupply
              while idx:
                  if t < 1:
                      revert with 0, 17
                  if 48 > !(idx % 10):
                      revert with 0, 17
                  if t - 1 >= mem[96]:
                      revert with 0, 50
                  mem[t + 127 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
                  t = t - 1
                  idx = idx / 10
                  continue 
              _196 = mem[64]
              mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
              mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
              mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
              _200 = mem[96]
              mem[mem[64] + 99 len ceil32(mem[96])] = mem[128 len ceil32(mem[96])]
              mem[mem[96] + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
              if ceil32(mem[96]) <= mem[96]:
                  _273 = mem[64]
                  mem[64] = mem[96] + mem[64] + 104
                  mem[mem[96] + _196 + 104] = 32
                  _289 = mem[_273]
                  mem[_200 + _196 + 136] = mem[_273]
                  mem[_200 + _196 + 168 len ceil32(_289)] = mem[_273 + 32 len ceil32(_289)]
                  if ceil32(_289) > _289:
                      mem[_289 + _200 + _196 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
              else:
                  _274 = mem[64]
                  mem[64] = mem[96] + mem[64] + 104
                  mem[mem[96] + _196 + 104] = 32
                  _290 = mem[_274]
                  mem[_200 + _196 + 136] = mem[_274]
                  mem[_200 + _196 + 168 len ceil32(_290)] = mem[_274 + 32 len ceil32(_290)]
                  if ceil32(_290) > _290:
                      mem[_290 + _200 + _196 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
  else:
      mem[100] = caller
      mem[132] = 0
      mem[164] = totalSupply
      mem[196] = 128
      mem[228] = 0
      call caller.onERC721Received(address operator, address from, uint256 childTokenId, bytes data) with:
           gas gas_remaining wei
          args 0, uint32(caller), 0, totalSupply, 128, 0
      mem[96] = ext_call.return_data[0]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >=ΓÇ▓ 32
      require ext_call.return_data == Mask(32, 224, ext_call.return_data[0])
      if Mask(32, 224, ext_call.return_data[0]) != 0x150b7a0200000000000000000000000000000000000000000000000000000000:
          revert with 0, 'UNSAFE_RECIPIENT'
      call stor10 with:
         value call.value / 40 wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      if call.value < call.value / 40:
          revert with 0, 17
      call owner with:
         value call.value - (call.value / 40) wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[0] = totalSupply
      if not -totalSupply:
          log 0xefe678c8: 32, 73, 'ipfs://bafybeicuplwjl4qmsnetgk7e', 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n', 0, 0, 199354445678, 0 >> 328, 0, caller, block.timestamp
      else:
          s = 0
          idx = totalSupply
          while idx:
              if not s + 1:
                  revert with 0, 17
              s = s + 1
              idx = idx / 10
              continue 
          if s > 18446744073709551615:
              revert with 0, 65
          mem[ceil32(return_data.size) + 96] = s
          if s:
              mem[ceil32(return_data.size) + 128 len s] = call.data[calldata.size len s]
          t = s
          idx = totalSupply
          while idx:
              if t < 1:
                  revert with 0, 17
              if 48 > !(idx % 10):
                  revert with 0, 17
              if t - 1 >= mem[ceil32(return_data.size) + 96]:
                  revert with 0, 50
              mem[t + ceil32(return_data.size) + 127 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
              t = t - 1
              idx = idx / 10
              continue 
          mem[ceil32(return_data.size) + ceil32(s) + 160] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
          mem[ceil32(return_data.size) + ceil32(s) + 192] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
          mem[ceil32(return_data.size) + ceil32(s) + 224] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
          mem[ceil32(return_data.size) + ceil32(s) + 227 len ceil32(mem[ceil32(return_data.size) + 96])] = mem[ceil32(return_data.size) + 128 len ceil32(mem[ceil32(return_data.size) + 96])]
          mem[mem[ceil32(return_data.size) + 96] + ceil32(return_data.size) + ceil32(s) + 227] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
          mem[64] = mem[ceil32(return_data.size) + 96] + ceil32(return_data.size) + ceil32(s) + 232
          mem[mem[ceil32(return_data.size) + 96] + ceil32(return_data.size) + ceil32(s) + 232] = 32
          mem[mem[ceil32(return_data.size) + 96] + ceil32(return_data.size) + ceil32(s) + 264] = mem[ceil32(return_data.size) + ceil32(s) + 128]
          mem[mem[ceil32(return_data.size) + 96] + ceil32(return_data.size) + ceil32(s) + 296 len ceil32(mem[ceil32(return_data.size) + ceil32(s) + 128])] = mem[ceil32(return_data.size) + ceil32(s) + 160 len ceil32(mem[ceil32(return_data.size) + ceil32(s) + 128])]
          if ceil32(mem[ceil32(return_data.size) + ceil32(s) + 128]) > mem[ceil32(return_data.size) + ceil32(s) + 128]:
              mem[mem[ceil32(return_data.size) + ceil32(s) + 128] + mem[ceil32(return_data.size) + 96] + ceil32(return_data.size) + ceil32(s) + 296] = 0
          log 0xefe678c8: Array(len=mem[ceil32(return_data.size) + ceil32(s) + 128], data=mem[mem[ceil32(return_data.size) + 96] + ceil32(return_data.size) + ceil32(s) + 296 len ceil32(mem[ceil32(return_data.size) + ceil32(s) + 128])]), caller, block.timestamp

def unknown75a6f85a(array _param1) payable: 
  require calldata.size - 4 >=ΓÇ▓ 32
  require _param1 <= 18446744073709551615
  require _param1 + 35 <ΓÇ▓ calldata.size
  require _param1.length <= 18446744073709551615
  require _param1 + (32 * _param1.length) + 36 <= calldata.size
  if not whitelistActive:
      revert with 556559901
  mem[0] = caller
  mem[32] = 15
  if stor15[caller] >= unknown2fe8a993:
      revert with 3968756323
  if 1 > !totalSupply:
      revert with 0, 17
  if totalSupply + 1 > 10000:
      revert with 1390387173
  if call.value < unknowne7b99ec7:
      revert with InsufficientFunds()
  mem[128] = caller
  mem[96] = 20
  mem[64] = (32 * _param1.length) + 180
  mem[148] = _param1.length
  mem[180 len 32 * _param1.length] = call.data[_param1 + 36 len 32 * _param1.length]
  mem[(32 * _param1.length) + 180] = 0
  idx = 0
  s = 0
  while idx < _param1.length:
      if idx >= mem[148]:
          revert with 0, 50
      _119 = mem[(32 * idx) + 180]
      if s + sha3(mem[128 len 20]) > mem[(32 * idx) + 180]:
          mem[mem[64] + 32] = mem[(32 * idx) + 180]
          mem[mem[64] + 64] = s + sha3(mem[128 len 20])
          _121 = mem[64]
          mem[mem[64]] = 64
          mem[64] = mem[64] + 96
          if not idx + 1:
              revert with 0, 17
          idx = idx + 1
          s = sha3(mem[_121 + 32 len mem[_121]])
          continue 
      mem[mem[64] + 32] = s + sha3(mem[128 len 20])
      mem[mem[64] + 64] = _119
      _125 = mem[64]
      mem[mem[64]] = 64
      mem[64] = mem[64] + 96
      if not idx + 1:
          revert with 0, 17
      idx = idx + 1
      s = sha3(mem[_125 + 32 len mem[_125]])
      continue 
  if s != stor13:
      revert with 163439417
  if not stor15[caller] + 1:
      revert with 0, 17
  stor15[caller]++
  if not totalSupply + 1:
      revert with 0, 17
  totalSupply++
  if not caller:
      revert with 0, 'INVALID_RECIPIENT'
  if ownerOf[stor6]:
      revert with 0, 'ALREADY_MINTED'
  balanceOf[caller]++
  mem[32] = 3
  ownerOf[stor6] = caller
  mem[0] = totalSupply
  log 0xfeddf252: 0, caller, totalSupply
  if not ext_code.size(caller):
      call stor10 with:
         value call.value / 40 wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      if call.value < call.value / 40:
          revert with 0, 17
      call owner with:
         value call.value - (call.value / 40) wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[0] = totalSupply
      if not -totalSupply:
          _152 = mem[64]
          mem[64] = mem[64] + 64
          mem[_152] = 1
          mem[_152 + 32] = 0x3000000000000000000000000000000000000000000000000000000000000000
          _153 = mem[64]
          mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
          mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
          mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 99] = 0x3000000000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 100] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
          _224 = mem[64]
          mem[64] = mem[64] + 105
          mem[_153 + 105] = 32
          _236 = mem[_224]
          mem[_153 + 137] = mem[_224]
          mem[_153 + 169 len ceil32(_236)] = mem[_224 + 32 len ceil32(_236)]
          if ceil32(_236) > _236:
              mem[_236 + _153 + 169] = 0
          log 0xefe678c8: mem[mememestamp
      else:
          s = 0
          idx = totalSupply
          while idx:
              if not s + 1:
                  revert with 0, 17
              s = s + 1
              idx = idx / 10
              continue 
          if s > 18446744073709551615:
              revert with 0, 65
          _221 = mem[64]
          mem[mem[64]] = s
          mem[64] = mem[64] + ceil32(s) + 32
          if not s:
              t = s
              idx = totalSupply
              while idx:
                  if t < 1:
                      revert with 0, 17
                  if 48 > !(idx % 10):
                      revert with 0, 17
                  if t - 1 >= mem[_221]:
                      revert with 0, 50
                  mem[t + _221 + 31 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
                  t = t - 1
                  idx = idx / 10
                  continue 
              _315 = mem[64]
              mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
              mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
              mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
              _319 = mem[_221]
              mem[mem[64] + 99 len ceil32(mem[_221])] = mem[_221 + 32 len ceil32(mem[_221])]
              mem[_319 + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
              if ceil32(_319) <= _319:
                  _391 = mem[64]
                  mem[64] = _319 + mem[64] + 104
                  mem[_319 + _315 + 104] = 32
                  _407 = mem[_391]
                  mem[_319 + _315 + 136] = mem[_391]
                  mem[_319 + _315 + 168 len ceil32(_407)] = mem[_391 + 32 len ceil32(_407)]
                  if ceil32(_407) > _407:
                      mem[_407 + _319 + _315 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
              else:
                  _392 = mem[64]
                  mem[64] = _319 + mem[64] + 104
                  mem[_319 + _315 + 104] = 32
                  _408 = mem[_392]
                  mem[_319 + _315 + 136] = mem[_392]
                  mem[_319 + _315 + 168 len ceil32(_408)] = mem[_392 + 32 len ceil32(_408)]
                  if ceil32(_408) > _408:
                      mem[_408 + _319 + _315 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
          else:
              mem[_221 + 32 len s] = call.data[calldata.size len s]
              t = s
              idx = totalSupply
              while idx:
                  if t < 1:
                      revert with 0, 17
                  if 48 > !(idx % 10):
                      revert with 0, 17
                  if t - 1 >= mem[_221]:
                      revert with 0, 50
                  mem[t + _221 + 31 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
                  t = t - 1
                  idx = idx / 10
                  continue 
              _316 = mem[64]
              mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
              mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
              mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
              _320 = mem[_221]
              mem[mem[64] + 99 len ceil32(mem[_221])] = mem[_221 + 32 len ceil32(mem[_221])]
              mem[_320 + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
              if ceil32(_320) <= _320:
                  _393 = mem[64]
                  mem[64] = _320 + mem[64] + 104
                  mem[_320 + _316 + 104] = 32
                  _409 = mem[_393]
                  mem[_320 + _316 + 136] = mem[_393]
                  mem[_320 + _316 + 168 len ceil32(_409)] = mem[_393 + 32 len ceil32(_409)]
                  if ceil32(_409) > _409:
                      mem[_409 + _320 + _316 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
              else:
                  _394 = mem[64]
                  mem[64] = _320 + mem[64] + 104
                  mem[_320 + _316 + 104] = 32
                  _410 = mem[_394]
                  mem[_320 + _316 + 136] = mem[_394]
                  mem[_320 + _316 + 168 len ceil32(_410)] = mem[_394 + 32 len ceil32(_410)]
                  if ceil32(_410) > _410:
                      mem[_410 + _320 + _316 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
  else:
      mem[mem[64] + 4] = caller
      mem[mem[64] + 36] = 0
      mem[mem[64] + 68] = totalSupply
      mem[mem[64] + 100] = 128
      mem[mem[64] + 132] = 0
      call caller.onERC721Received(address operator, address from, uint256 childTokenId, bytes data) with:
           gas gas_remaining wei
          args caller, 0, totalSupply, 128, 0
      mem[mem[64]] = ext_call.return_data[0]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      _143 = mem[64]
      mem[64] = mem[64] + ceil32(return_data.size)
      require return_data.size >=ΓÇ▓ 32
      require mem[_143] == Mask(32, 224, mem[_143])
      if Mask(32, 224, mem[_143]) != 0x150b7a0200000000000000000000000000000000000000000000000000000000:
          revert with 0, 'UNSAFE_RECIPIENT'
      call stor10 with:
         value call.value / 40 wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      if call.value < call.value / 40:
          revert with 0, 17
      call owner with:
         value call.value - (call.value / 40) wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      mem[0] = totalSupply
      if not -totalSupply:
          _166 = mem[64]
          mem[64] = mem[64] + 64
          mem[_166] = 1
          mem[_166 + 32] = 0x3000000000000000000000000000000000000000000000000000000000000000
          _170 = mem[64]
          mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
          mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
          mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 99] = 0x3000000000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 100] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
          _226 = mem[64]
          mem[64] = mem[64] + 105
          mem[_170 + 105] = 32
          _240 = mem[_226]
          mem[_170 + 137] = mem[_226]
          mem[_170 + 169 len ceil32(_240)] = mem[_226 + 32 len ceil32(_240)]
          if ceil32(_240) > _240:
              mem[_240 + _170 + 169] = 0
          log 0xefe678c8: mem[mememestamp
      else:
          s = 0
          idx = totalSupply
          while idx:
              if not s + 1:
                  revert with 0, 17
              s = s + 1
              idx = idx / 10
              continue 
          if s > 18446744073709551615:
              revert with 0, 65
          _222 = mem[64]
          mem[mem[64]] = s
          mem[64] = mem[64] + ceil32(s) + 32
          if not s:
              t = s
              idx = totalSupply
              while idx:
                  if t < 1:
                      revert with 0, 17
                  if 48 > !(idx % 10):
                      revert with 0, 17
                  if t - 1 >= mem[_222]:
                      revert with 0, 50
                  mem[t + _222 + 31 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
                  t = t - 1
                  idx = idx / 10
                  continue 
              _317 = mem[64]
              mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
              mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
              mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
              _321 = mem[_222]
              mem[mem[64] + 99 len ceil32(mem[_222])] = mem[_222 + 32 len ceil32(mem[_222])]
              mem[_321 + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
              if ceil32(_321) <= _321:
                  _395 = mem[64]
                  mem[64] = _321 + mem[64] + 104
                  mem[_321 + _317 + 104] = 32
                  _411 = mem[_395]
                  mem[_321 + _317 + 136] = mem[_395]
                  mem[_321 + _317 + 168 len ceil32(_411)] = mem[_395 + 32 len ceil32(_411)]
                  if ceil32(_411) > _411:
                      mem[_411 + _321 + _317 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
              else:
                  _396 = mem[64]
                  mem[64] = _321 + mem[64] + 104
                  mem[_321 + _317 + 104] = 32
                  _412 = mem[_396]
                  mem[_321 + _317 + 136] = mem[_396]
                  mem[_321 + _317 + 168 len ceil32(_412)] = mem[_396 + 32 len ceil32(_412)]
                  if ceil32(_412) > _412:
                      mem[_412 + _321 + _317 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
          else:
              mem[_222 + 32 len s] = call.data[calldata.size len s]
              t = s
              idx = totalSupply
              while idx:
                  if t < 1:
                      revert with 0, 17
                  if 48 > !(idx % 10):
                      revert with 0, 17
                  if t - 1 >= mem[_222]:
                      revert with 0, 50
                  mem[t + _222 + 31 len 8] = Mask(8, -(('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) + 256, 0) << (('mask_shl', 8, 0, 245, ('add', 48, ('mod', ('var', 0), 10))), 0) - 256
                  t = t - 1
                  idx = idx / 10
                  continue 
              _318 = mem[64]
              mem[mem[64] + 32] = 'ipfs://bafybeicuplwjl4qmsnetgk7e'
              mem[mem[64] + 64] = 'mkhsepvsnpb4vqiq2gcc2h5m2l2byc3n'
              mem[mem[64] + 96] = 0x6d692f0000000000000000000000000000000000000000000000000000000000
              _322 = mem[_222]
              mem[mem[64] + 99 len ceil32(mem[_222])] = mem[_222 + 32 len ceil32(mem[_222])]
              mem[_322 + mem[64] + 99] = 0x2e6a736f6e000000000000000000000000000000000000000000000000000000
              if ceil32(_322) <= _322:
                  _397 = mem[64]
                  mem[64] = _322 + mem[64] + 104
                  mem[_322 + _318 + 104] = 32
                  _413 = mem[_397]
                  mem[_322 + _318 + 136] = mem[_397]
                  mem[_322 + _318 + 168 len ceil32(_413)] = mem[_397 + 32 len ceil32(_413)]
                  if ceil32(_413) > _413:
                      mem[_413 + _322 + _318 + 168] = 0
                  log 0xefe678c8: mem[mememestamp
              else:
                  _398 = mem[64]
                  mem[64] = _322 + mem[64] + 104
                  mem[_322 + _318 + 104] = 32
                  _414 = mem[_398]
                  mem[_322 + _318 + 136] = mem[_398]
                  mem[_322 + _318 + 168 len ceil32(_414)] = mem[_398 + 32 len ceil32(_414)]
                  if ceil32(_414) > _414:
                      mem[_414 + _322 + _318 + 168] = 0
                  log 0xefe678c8: mem[mememestamp

