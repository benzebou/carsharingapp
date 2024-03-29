package cs.engine.action;

import cs.dao.dao.OfferDAO;
import cs.model.Offer;

public class OfferEngineAction
{
	private OfferDAO caBean;
	
	public OfferDAO getCaBean() {
		return caBean;
	}
	public void setCaBean(OfferDAO caBean) {
		this.caBean = caBean;
	}

	public OfferEngineAction()
	{
		//caBean = SpringDAO.getSpring().getOfferDAO();
		//XmlBeanFactory beanFactory =  new XmlBeanFactory(new ClassPathResource("bean.xml"));
		//caBean = (OfferDAO) beanFactory.getBean("OfferDAO");
	}
	
	public Offer load(Integer id)
	{
		if(caBean != null)
		{
			return caBean.load(id);
		}
		return null;
	}
	
//	public List<Offer> getCustomerOffers(Integer idCustomerAccount)
//	{
//		if(caBean != null)
//		{
//			return caBean.loadCustomerOffers(idCustomerAccount);
//		}
//		return null;
//	}
	
//	public Boolean saveOfferWithRoutes(Offer offer, List<Route> routes)
//	{
//		if(caBean != null)
//		{
//			return caBean.saveOfferWithRoutes(offer, routes);
//		}
//		return false;
//	}
}
