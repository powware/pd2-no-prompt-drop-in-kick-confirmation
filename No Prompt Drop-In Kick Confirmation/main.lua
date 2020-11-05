NoPromptDropInKickConfirmation = NoPromptDropInKickConfirmation or {}

function NoPromptDropInKickConfirmation.Hooks()
	if RequiredScript == "lib/managers/hud/hudwaitinglegend" then
		function HUDWaitingLegend:kick()
			if self._current_peer then
				managers.vote:message_host_kick_no_confirmation(self._current_peer)
			end
		end
	elseif RequiredScript == "lib/managers/votemanager" then
		function VoteManager:message_host_kick_no_confirmation(peer)
			if peer then
				managers.network:session():send_to_peers("kick_peer", peer:id(), 0)
				managers.network:session():on_peer_kicked(peer, peer:id(), 0)
			end

			managers.menu:back(true)
		end
	end
end

NoPromptDropInKickConfirmation.Hooks()
