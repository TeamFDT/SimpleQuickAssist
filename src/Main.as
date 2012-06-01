package {
	import fdt.FdtTextEdit;

	import swf.bridge.FdtEditorContext;
	import swf.bridge.IFdtActionBridge;
	import swf.plugin.ISwfActionPlugin;

	import flash.display.Sprite;
	import flash.utils.Dictionary;

	[FdtSwfPlugin(name="ReplaceSpeak", pluginType="action", toolTip="Replaces the word 'speak' with another.")]
	public class Main extends Sprite implements ISwfActionPlugin {
		[Embed(source="../assets/icon.gif", mimeType="application/octet-stream")]
		private var QuickAssistIcon : Class;
		private var bridge : IFdtActionBridge;
		private var commands : Dictionary = new Dictionary();
		private var wordToReplace : String = "speak";

		public function Main() {
			FdtSwfPluginIcon;
			commands["sayHello"] = "'Hello!'";
			commands["sayGoodbye"] = "'Goodbye...'";
		}

		public function init(bridge : IFdtActionBridge) : void {
			this.bridge = bridge;
			this.bridge.ui.registerImage('QuickAssistIcon', new QuickAssistIcon()).sendTo(this, null);
		}

		public function callEntryAction(entryId : String) : void {
		}

		public function createProposals(ec : FdtEditorContext) : void {
			var tokens : Array = ec.currentLine.replace(/^[\s\t]*/, '').split(" ");
			for each (var token : String in tokens) {
				if (token == wordToReplace || token == 'Speak') {
					bridge.offerProposal("sayHello", "QuickAssistIcon", "Say Hello", "", applyChanges);
					bridge.offerProposal("sayGoodbye", "QuickAssistIcon", "Say Goodbye", "", applyChanges);
				}
			}
		}

		private function applyChanges(idOfQuickAssistChosen : String, ec : FdtEditorContext) : void {
			var textEdits : Vector.<FdtTextEdit> = new Vector.<FdtTextEdit>();
			textEdits.push(new FdtTextEdit(ec.selectionOffset - wordToReplace.length, wordToReplace.length, commands[idOfQuickAssistChosen]));
			bridge.model.fileDocumentModify(ec.currentFile, textEdits).sendTo(this, null);
		}

		public function dialogClosed(dialogInstanceId : String, result : String) : void {
			
			// below, place your cursor after the word 'speak' and you can replace it with another phrase 
			// 'Hello!'
		}

		public function setOptions(options : Dictionary) : void {
		}
	}
}
