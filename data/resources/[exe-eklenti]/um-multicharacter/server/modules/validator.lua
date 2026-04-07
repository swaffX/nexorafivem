local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = Config
L0_1 = L0_1.Identity
if not L0_1 then
  L0_1 = {}
end
L1_1 = "[<>\"'/\\;.,!?{}%[%]%(%)=0-9]"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = L1_1
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if "string" ~= L3_2 then
    L3_2 = false
    L4_2 = A0_2
    L5_2 = " must be a string"
    L4_2 = L4_2 .. L5_2
    return L3_2, L4_2
  end
  L4_2 = A1_2
  L3_2 = A1_2.match
  L5_2 = "^%s*(.-)%s*$"
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = A2_2.min
  if L4_2 then
    L4_2 = #L3_2
    L5_2 = A2_2.min
    if L4_2 < L5_2 then
      L4_2 = false
      L5_2 = A0_2
      L6_2 = " must be at least "
      L7_2 = A2_2.min
      L8_2 = " characters"
      L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
      return L4_2, L5_2
    end
  end
  L4_2 = A2_2.max
  if L4_2 then
    L4_2 = #L3_2
    L5_2 = A2_2.max
    if L4_2 > L5_2 then
      L4_2 = false
      L5_2 = A0_2
      L6_2 = " must be at most "
      L7_2 = A2_2.max
      L8_2 = " characters"
      L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
      return L4_2, L5_2
    end
  end
  L4_2 = A2_2.regex
  if L4_2 then
    L5_2 = L3_2
    L4_2 = L3_2.match
    L6_2 = A2_2.regex
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      L4_2 = false
      L5_2 = A2_2.errorMessage
      if not L5_2 then
        L5_2 = A0_2
        L6_2 = " is invalid"
        L5_2 = L5_2 .. L6_2
      end
      return L4_2, L5_2
    end
  end
  L4_2 = A2_2.validateName
  if L4_2 then
    L4_2 = L2_1
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L4_2 = false
      L5_2 = A2_2.errorMessage
      if not L5_2 then
        L5_2 = A0_2
        L6_2 = " contains invalid characters"
        L5_2 = L5_2 .. L6_2
      end
      return L4_2, L5_2
    end
  end
  L4_2 = A2_2.nonempty
  if L4_2 then
    L4_2 = #L3_2
    if 0 == L4_2 then
      L4_2 = false
      L5_2 = A0_2
      L6_2 = " is required"
      L5_2 = L5_2 .. L6_2
      return L4_2, L5_2
    end
  end
  L4_2 = true
  L5_2 = L3_2
  return L4_2, L5_2
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = L3_1
  L3_2 = "Firstname"
  L4_2 = A0_2.firstname
  L5_2 = {}
  L6_2 = L0_1.CharacterName
  L6_2 = L6_2.Min
  L5_2.min = L6_2
  L6_2 = L0_1.CharacterName
  L6_2 = L6_2.Max
  L5_2.max = L6_2
  L5_2.validateName = true
  L5_2.nonempty = true
  L6_2 = L0_1.Errors
  L6_2 = L6_2.Firstname
  L5_2.errorMessage = L6_2
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if not L2_2 then
    L1_2.firstname = L3_2
  end
  L4_2 = L3_1
  L5_2 = "Lastname"
  L6_2 = A0_2.lastname
  L7_2 = {}
  L8_2 = L0_1.CharacterName
  L8_2 = L8_2.Min
  L7_2.min = L8_2
  L8_2 = L0_1.CharacterName
  L8_2 = L8_2.Max
  L7_2.max = L8_2
  L7_2.validateName = true
  L7_2.nonempty = true
  L8_2 = L0_1.Errors
  L8_2 = L8_2.Lastname
  L7_2.errorMessage = L8_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L5_2
  L2_2 = L4_2
  if not L2_2 then
    L1_2.lastname = L3_2
  end
  L4_2 = L3_1
  L5_2 = "Date of Birth"
  L6_2 = A0_2.dateofbirth
  L7_2 = {}
  L7_2.regex = "^%d%d/%d%d/%d%d%d%d$"
  L7_2.nonempty = true
  L7_2.errorMessage = "Date format should be DD/MM/YYYY"
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L5_2
  L2_2 = L4_2
  if not L2_2 then
    L1_2.dateOfBirth = L3_2
  else
    L4_2 = A0_2.dateofbirth
    L5_2 = L4_2
    L4_2 = L4_2.match
    L6_2 = "^(%d%d)/(%d%d)/(%d%d%d%d)$"
    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
    L7_2 = tonumber
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L6_2 = L7_2
    L7_2 = L0_1.DobYear
    L7_2 = L7_2.Lowest
    if L6_2 < L7_2 then
      L7_2 = L0_1.Errors
      L7_2 = L7_2.LowestDob
      L8_2 = " "
      L9_2 = L0_1.DobYear
      L9_2 = L9_2.Lowest
      L7_2 = L7_2 .. L8_2 .. L9_2
      L1_2.dateOfBirth = L7_2
    else
      L7_2 = L0_1.DobYear
      L7_2 = L7_2.Highest
      if L6_2 > L7_2 then
        L7_2 = L0_1.Errors
        L7_2 = L7_2.HighestDob
        L8_2 = " "
        L9_2 = L0_1.DobYear
        L9_2 = L9_2.Highest
        L7_2 = L7_2 .. L8_2 .. L9_2
        L1_2.dateOfBirth = L7_2
      end
    end
  end
  L4_2 = L3_1
  L5_2 = "Sex"
  L6_2 = A0_2.sex
  L7_2 = {}
  L7_2.regex = "^[mfMF]$"
  L7_2.nonempty = true
  L7_2.errorMessage = "Sex must be 'm' or 'f'"
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L5_2
  L2_2 = L4_2
  if not L2_2 then
    L1_2.sex = L3_2
  end
  L4_2 = L3_1
  L5_2 = "Height"
  L6_2 = tostring
  L7_2 = A0_2.height
  L6_2 = L6_2(L7_2)
  L7_2 = {}
  L7_2.regex = "^[0-9]+$"
  L7_2.nonempty = true
  L7_2.errorMessage = "Height must be a number"
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L5_2
  L2_2 = L4_2
  if not L2_2 then
    L1_2.height = L3_2
  end
  L4_2 = L3_1
  L5_2 = "Cid"
  L6_2 = A0_2.cid
  L7_2 = {}
  L7_2.regex = "^[0-9]+$"
  L7_2.nonempty = true
  L7_2.errorMessage = "Cid must be a number"
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L5_2
  L2_2 = L4_2
  if not L2_2 then
    L1_2.cid = L3_2
  end
  L4_2 = next
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = false
    L5_2 = L1_2
    return L4_2, L5_2
  else
    L4_2 = true
    L5_2 = "Validation successful"
    return L4_2, L5_2
  end
end
ValidateRegistration = L4_1
