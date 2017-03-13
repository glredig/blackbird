var QuoteWidget = (function() {
	var quotes = [],
		element,
		url,
		start_time,
		animation_phases = {
	        'pause' : 4500,
	        'fadeOut' : 1200,
	        'delay' : 200,
	        'fadeIn' : 1000
      	},
      	current_phase = 'pause';

	function init(config) {
		element = config.element;
		url = element.getAttribute('data-url');

		$.ajax({
			type: 'GET',
			url: url + '.json',
			dataType: 'json'
		}).done(function(data) {
			console.log('data', data);
			load(data);
		}).fail(function() {
			console.log("Failed to load quotes");
		});
	}

	function load(data) {
		var el,
			name;

		for (var i = 0; i < data.length; i++) {
			quote = new Quote({
				text: data[i].summary,
				name: data[i].name,
				position: i,
				parent: element
			});

			quote.init();

			quotes.push(quote);
		}
		current_quote = quotes[0];
		loop();
	}

	var loop = function() {
    	animate();
    	requestAnimationFrame(loop);
  	};

  	function animate(time) {
    	var current_time = (new Date).getTime();
    	if (start_time === undefined) {
      		start_time = (new Date).getTime();
    	}
    	if (current_time - start_time > animation_phases[current_phase]) {
      		current_phase = moveToNextPhase();
    	}
    	else {
      		current_quote[current_phase](current_time - start_time);
    	}
  	}

  	function moveToNextPhase() {
    	start_time = (new Date).getTime();
    	switch(current_phase) {
     	  case 'pause':
	        return 'fadeOut'
	        break;
	      case 'fadeOut':
	        return 'delay'
	        break;
	      case 'delay':
	        moveToNextQuote();
	        return 'fadeIn'
	        break;
	      case 'fadeIn':
	        return 'pause'
	        break;
	      default:
	        return 'pause'
	        break;
        }
    }

    function moveToNextQuote() {
      var index = quotes.indexOf(current_quote);
      if (index < quotes.length - 1) {
        current_quote = quotes[index + 1];
      }
      else {
        current_quote = quotes[0];
      }
    }

    function Quote(config) {
    	this.summary = config.text.split('').slice(0, 120).join('');
    	this.name = config.name || "Anonymous";
    	this.parent_node = config.parent;
    	this.position = config.position;
    }

    Quote.prototype = {
    	init: function() {
    		this._build();
    		if (this.position != 0) {
    			this.node.style.opacity = 0;
    		}
    	},

    	_build: function() {
    		var name;
    		this.node = document.createElement('div');
			this.node.className = 'quote';
			this.node.innerText = '"' + this.summary + '..."';
			name = document.createElement('div');
			name.className = 'quote_name';
			name.innerText = this.name;
			this.node.appendChild(name);
			this.parent_node.appendChild(this.node);
    	},

	    fadeOut: function(time) {
	      this.node.style.opacity = 1 - (time / animation_phases.fadeOut);
	    },

	    fadeIn: function(time) {
	      this.node.style.opacity = time / animation_phases.fadeOut;
	    },

	    pause: function(time) {
	      this.node.style.opacity = 1;
	    },

	    delay: function(time) {
	      this.node.style.opacity = 0;
	    }
    }

	return {
		init: init
	}
})();