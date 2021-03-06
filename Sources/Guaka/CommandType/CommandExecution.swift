import StringScanner


func executeCommand(rootCommand: CommandType, args: [String]) -> Result {
  
  let (command, args) = actualCommand(forCommand: rootCommand, args: args)
  let flagSet = command.flagSet
  
  let flagSetWithHelp = flagSet.flagSetAppeningHelp()
  
  do {
    let (optionFlags, positionalArguments) = try flagSetWithHelp.parse(args: args)
    var preparedFlags = try flagSetWithHelp.getPreparedFlags(withFlagValues: optionFlags)
    
    // If help flag is set, show help message
    if
      let help = preparedFlags["help"],
      help.value as? Bool == true {
      return .message(command.helpMessage)
    } else {
      preparedFlags["help"] = nil
    }
    
    let res = flagSet.checkAllRequiredFlagsAreSet(preparedFlags: preparedFlags)
    if case let .error(error) = res {
      throw error
    }
    
    command.execute(flags: preparedFlags, args: positionalArguments)
  } catch {
    return .error(CommandErrors.commandGeneralError(command, error))
  }
  
  return .success
}


func actualCommand(forCommand command: CommandType, args: [String]) -> (CommandType, [String]) {
  var possibleCommands = [String]()
  
  let flagSet = command.flagSet
  
  skippabeIterator(array: args) { arg in
    let token = ArgTokenType(fromString: arg)
    
    if case let .positionalArgument(str) = token {
      possibleCommands.append(str)
    }
    
    if token.isFlag && !flagSet.isFlagSatisfied(token: token) {
      return true
    }
    
    return false
  }
  
  guard
    let first = possibleCommands.first,
    let nextCommand = command[withName: first]
    else {
      return (command, args)
  }
  
  let remainingArgs = remove(arg: first, fromArgs: args)
  
  return actualCommand(forCommand: nextCommand, args: remainingArgs)
}


private func remove(arg: String, fromArgs args: [String]) -> [String] {
  return args.filter { $0 != arg }
}


private func skippabeIterator<T>(array: [T], block: (T) -> (Bool)) {
  var skipNext = false
  for element in array {
    
    if skipNext {
      skipNext = false
      continue
    }
    
    if block(element) {
      skipNext = true
    }
  }
}
