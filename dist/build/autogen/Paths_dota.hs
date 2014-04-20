module Paths_dota (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Fraser/.cabal/bin"
libdir     = "/Users/Fraser/.cabal/lib/x86_64-osx-ghc-7.8.2/dota-0.1.0.0"
datadir    = "/Users/Fraser/.cabal/share/x86_64-osx-ghc-7.8.2/dota-0.1.0.0"
libexecdir = "/Users/Fraser/.cabal/libexec"
sysconfdir = "/Users/Fraser/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "dota_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "dota_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "dota_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dota_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dota_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
