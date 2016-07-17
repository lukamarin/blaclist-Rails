class FeedlyTokens
  def self.tokens
    [
     'A0ALpflbg5v5FM3SgwbzTN1SFIvxsSaFLGSxA2RCU2LwYWfa3cwOjk_lTxPTkNatXmvO0k1sfAZJYhU8K-RdZAOmeo9rTxyqkiPVdPar7p8vxfq0dm8xbq3vKxk0_1mwH7sLJcfF-x1IJgBOh67mGiSZe9LJJlmRWooSnjK2SyDTnwFGjrX8NcwXCb4wimi5-x0XHPfgvW6CWmAimETiDDDtZYdB:feedlydev',
     'A3_rLmD93b8I0XfKke5Fcyjfe8e3_ySvlXPwFOY9f4WGMz_FTLH3xgg0wgn_oVEUE8wEPtBHTweGa9E9ZBpu2vhmk3VblJPDfFNnpPpo9-gsrhNQHNSVe01QSblmb-NdWqJcH2uNxsBAbPdi8wc80IQCADu6RXuSBrAcmoHb5Bham13t1tXmSqHmspDwYPNczmzGT45Tbb_REB0Vzjx7coApBLZw:feedlydev',
     'Az3M3QUjiqW8ht_tf13p2hK5a9BQC1XyOG_aAmZhaW5nKNThwGh2iwdnQkKUH4mtEA-Psi3TxKXOtUVvjWGFp2Ue5TXl4k0BrkmFg4jt9urY4pYyH9lLsGYc72uWwaq_ZNGKc46HOZNyVfV0CsxjURpxx3xa1MLeiojmUybIkTHK1GT3shp5t6TEweWhwFcH8qOSv7UPqAXlVPzum6UaaDjm5ykL:feedlydev',
     'Az3PqgPRnEh2LuxGW6qv2V0hVSsF6jOjhIxtjKm4T-MCsC9HGmHnBfe1omDlybTzXAeXhoh8czTSHV8dN3IxclsFsEdI4n5EUt-NyYda-lN4fPajfgsaxyGHuREgsu2BFlRmP3ssf0yVzK97sQGLcz5BWddCrwFVm30v1kgdHfcmna__OAfk1HOIXpWjn4_LhuiesDKeNwLuNQwRjEUeLnt22EEHEQ:feedlydev',
     'Az3RcgSycPyxWftXjmFZYalQTIrmQZQMKicGnOoUVdlbB1_BZE98rd24cQWwpUwyOXeRLjHmFrbQflT6x2T19gQXwHAgPWqXVW623pwig216Itnk3C4HBf3u-yz8lBAgOee5iu80mi9D0R8p568ToAf1nYBxPcUx9UtBY-ibdeo-8l0gsffM0EUV1L0XAQT9Ndmso8W-W9_o0yxZAUQvohSgZvSH9Q:feedlydev'
    ]
  end

  def self.get_token(current_token = nil)
  	return self.tokens[0] if current_token.nil?

  	self.tokens.each_with_index do |token, index|
      return self.tokens[index+1] if token == current_token
  	end
  end
end