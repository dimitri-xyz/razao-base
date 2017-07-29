module Reactive.Banana.Frameworks.Extended
 ( module Reactive.Banana.Frameworks
 , HandlerSet(..)
 , newHandlerSet
 , fromHandlerSet
 , activate
 ) where

import Reactive.Banana.Frameworks

-- changing the names to better match the semantics
type HandlerSet = AddHandler
newHandlerSet   = newAddHandler
fromHandlerSet  = fromAddHandler
activate        = actuate
