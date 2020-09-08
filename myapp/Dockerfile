FROM node

WORKDIR /scripts

COPY . .

RUN npm install
RUN groupadd app
RUN useradd -g app -m app
RUN mv /root/.config /home/app/
RUN chown -R app:app /scripts /home/app/.config

USER app

EXPOSE 3000

CMD ["npm", "start"]
