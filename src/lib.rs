use zed_extension_api::{self as zed, LanguageServerId, Result};

struct NotistExtension;

impl zed::Extension for NotistExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let command = worktree.which("notist").ok_or_else(|| {
            "the Notist executable was not found in PATH; install it from https://github.com/AzurIce/Notist and restart Zed".to_owned()
        })?;
        Ok(zed::Command {
            command,
            args: vec!["lsp".into()],
            env: Default::default(),
        })
    }
}

zed::register_extension!(NotistExtension);
